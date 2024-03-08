pageextension 50106 SalesOrderSubExt extends "Sales Order Subform"
{
    layout
    {
        addlast(Control45)
        {
            group(Control29)
            {
                Caption = '';
                Visible = TempIsHandled;
                field(TotalExclVAT; TotalExclVAT)
                {
                    ApplicationArea = All;
                    Caption = 'Total Excl. VAT (RON)';
                    Editable = false;
                }
                field(TotalVat; TotalVat)
                {
                    ApplicationArea = All;
                    Caption = 'Total VAT (RON)';
                    Editable = false;
                }
                field(TotalInclVAT; TotalInclVAT)
                {
                    ApplicationArea = All;
                    Caption = 'Total Incl. VAT (RON)';
                    Editable = false;
                }
            }

        }
        modify("Line Amount")
        {
            trigger OnAfterValidate()
            begin
                GetTotalVAT(Rec);
            end;
        }
        modify(Control28)
        {
            Visible = Ishandled;
        }
    }
    actions
    {
        // Add changes to page actions here
    }
    trigger OnAfterGetRecord()
    var
        Code: Codeunit ECImport;
    begin
        //GetUnitPrice(Rec);
        Code.GetUnitPrice(Rec);
        HideControl(rec, info);
    end;

    trigger OnAfterGetCurrRecord()
    begin
        GetTotalVAT(Rec);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        GetTotalVAT(Rec);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        GetTotalVAT(Rec);
    end;

    procedure GetUnitPrice(Rec: Record "Sales Line")
    var
        Salesprice: Record "Sales Price";
        SalesHeader: Record "Sales Header";
        customer: Record Customer;
        item: Record Item;
    begin
        SalesHeader.SetRange(SalesHeader."No.", Rec."Document No.");
        if SalesHeader.FindSet() then begin
            if SalesHeader."Customer Posting Group" = 'DOMESTIC' then begin
                if (SalesHeader."Currency Code" = '') or (SalesHeader."Currency Code" = 'EUR') then begin
                    rec.SetRange("Document Type", Rec."Document Type"::Order);
                    Rec.SetRange("Document No.", Rec."Document No.");
                    rec.SetRange("Line No.", Rec."Line No.");
                    if Rec.FindSet() then begin
                        item.SetRange("No.", Rec."No.");
                        if item.FindSet() then begin
                            if item."No." = rec."No." then begin
                                Rec.Validate("Unit Price", item."Unit Price");
                                // Rec."Line Amount" := (Rec.Quantity * Rec."Unit Price");
                                Rec.Modify();
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;

    procedure HideControl(rec: Record "Sales Line"; info: record "Sales Header")
    begin
        info.SetRange("No.", rec."Document No.");
        if info.FindSet() then begin
            if info."Currency Code" = 'EUR' then begin
                Ishandled := false;
                TempIsHandled := true;
            end
            else begin
                Ishandled := true;
                TempIsHandled := false;
            end;
        end;
    end;

    procedure GetTotalVAT(rec: Record "Sales Line")
    begin
        TotalExclVAT := 0;
        TotalInclVAT := 0;
        rec.CopyFilters(Rec);
        TotalExclVAT := rec."Line Amount";
        TotalInclVAT := rec."Amount Including VAT";
        TotalVat := (TotalInclVAT - TotalExclVAT);
    end;

    var
        info: record "Sales Header";
        Ishandled: Boolean;
        TempIsHandled: Boolean;
        TotalExclVAT: Decimal;
        TotalInclVAT: Decimal;
        TotalVat: Decimal;
}


