codeunit 50101 ECImport
{
    procedure CreateSalesInvoice(rec: Record "EC import"; Ishandle: Boolean)
    var
        customer: Record Customer;
        Item: Record Item;
        salesheader: Record "Sales Header";
        salesline: Record "Sales Line";
    begin
        Ishandle := false;
        repeat
            rec.SetRange("EDH ID", rec."EDH ID");
            rec.SetRange("Sales Invoice Cretaed", false);
            if rec.FindSet() then begin

                if not customer.get(rec."Customer No.") then begin
                    Message('%1 customer is not able in the Customer table', rec."Customer No.");
                    rec."Error Description" := 'customer is not able in the Customer table';
                end else begin
                    if not Item.Get(rec."Item No.") then begin
                        Message('%1 item is not able in the item table', rec."Item No.");
                        rec."Error Description" := 'item is not able in the item table';
                    end else begin
                        salesheader.Init();
                        salesheader."Document Type" := salesheader."Document Type"::Invoice;
                        salesheader.Validate("Sell-to Customer No.", rec."Customer No.");
                        salesheader.Insert(true);

                        // salesline.Init();
                        // salesline."Document Type" := salesline."Document Type"::Invoice;
                        // salesline.Type := salesline.Type::Item;
                        // salesline."Document No." := salesheader."No.";
                        // salesline.Validate("No.", rec."Item No.");
                        // if rec.Description <> '' then
                        //     salesline.Description := rec.Description
                        // else
                        //     salesline.Description := Item."Description";
                        // salesline.Insert(true);
                        // rec."Sales Invoice Cretaed" := true;
                        // rec."Error Description" := '';
                    end;
                end;
            end;
            rec.Modify(true);
        until rec.Next() = 0;
    end;

    procedure GetUnitPrice(Rec: Record "Sales Line")
    var
        Salesprice: Record "Sales Price";
        SalesHeader: Record "Sales Header";
        customer: Record Customer;
        item: Record Item;
        CurrExRate: Record "Currency Exchange Rate";
        GeneralLedgerSetup: Record "General Ledger Setup";
        CurrCode: Code[20];
    begin
        GeneralLedgerSetup.Get();
        SalesHeader.SetRange(SalesHeader."No.", Rec."Document No.");
        if SalesHeader.FindSet() then begin
            if SalesHeader."Customer Posting Group" = 'DOMESTIC' then begin
                if (SalesHeader."Currency Code" = '') or (SalesHeader."Currency Code" = 'EUR') then begin
                    rec.SetRange("Document Type", Rec."Document Type"::Order);
                    Rec.SetRange("Document No.", Rec."Document No.");
                    rec.SetRange("Line No.", Rec."Line No.");
                    if Rec.FindSet() then begin
                        if Rec."Currency Code" = '' then
                            CurrCode := GeneralLedgerSetup."LCY Code";
                        Salesprice.Reset();
                        Salesprice.SetRange("Sales Type", Salesprice."Sales Type"::Customer);
                        Salesprice.SetRange("Sales Code", Rec."Sell-to Customer No.");
                        Salesprice.SetRange("Item No.", Rec."No.");
                        if Salesprice.FindLast() then
                            CurrExRate.Reset();
                        CurrExRate.SetRange(CurrExRate."Currency Code", GeneralLedgerSetup."LCY Code");
                        if CurrExRate.FindLast() then begin
                            Rec."Unit Price" := Salesprice."Unit Price" * CurrExRate."Relational Exch. Rate Amount";
                            Rec.Modify();
                        end;
                    end;
                end;
            end;
        end;
    end;
}