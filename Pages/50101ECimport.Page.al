page 50101 "EC Import"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "EC import";
    Caption = 'EC Import';

    layout
    {
        area(Content)
        {
            repeater(Control)
            {
                field("EDH ID"; Rec."EDH ID")
                {
                    ApplicationArea = All;
                    Caption = 'EDH ID';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                }
                field("Customer sync ID"; Rec."Customer sync ID")
                {
                    ApplicationArea = All;
                    Caption = 'Customer sync ID';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    Caption = 'Item No.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    Caption = 'Amount';
                }
                field("EDH Date"; Rec."EDH Date")
                {
                    ApplicationArea = All;
                    Caption = 'EDH Date';
                }
                field(URL; Rec.URL)
                {
                    ApplicationArea = All;
                    Caption = 'URL';
                }
                field("Error Description"; Rec."Error Description")
                {
                    ApplicationArea = All;
                    Caption = 'Error Description';
                }
                field("Sales Invoice Cretaed"; Rec."Sales Invoice Cretaed")
                {
                    ApplicationArea = All;
                    Caption = 'Sales Invoice Cretaed';
                    // Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CreateSalesInvoice)
            {
                ApplicationArea = All;
                Caption = 'Create Sales Invoice';
                trigger OnAction()
                var
                    code: Codeunit ECImport;
                begin
                    code.CreateSalesInvoice(Rec, true);
                    // CreateSI(Rec);
                end;
            }
        }
    }
    procedure CreateSI(Rec: Record "EC import")
    var
        Sales: Record "Sales Header";
        Ishandle: Boolean;
        customer: Record Customer;
        item: Record Item;
        salesLine: Record "Sales Line";
    begin
        Ishandle := false;
        //  CurrPage.SetSelectionFilter(Rec);
        Rec.SetRange("EDH ID", Rec."EDH ID");
        if Rec.FindSet() then begin
            if Rec."Sales Invoice Cretaed" = Ishandle then begin
                if Rec."Customer No." <> '' then begin
                    customer.SetRange("No.", Rec."Customer No.");
                    if customer.FindSet() then begin
                        if Rec."Item No." <> '' then begin
                            item.SetRange("No.", Rec."Item No.");
                            if item.FindSet() then begin
                                Sales.Init();
                                Sales."Document Type" := Sales."Document Type"::Invoice;
                                sales.Validate("Sell-to Customer No.", Rec."Customer No.");
                                Sales.Validate("Document Date", Rec."EDH Date");
                                Sales.Insert(true);

                                salesLine.Init();
                                salesLine."Document Type" := salesLine."Document Type"::Invoice;
                                salesLine.Type := salesLine.Type::Item;
                                salesLine."Document No." := Sales."No.";
                                salesLine."No." := Rec."Item No.";
                                salesLine.Quantity := 1;
                                salesLine.Validate("Unit Price", Rec.Amount);
                                if Rec.Description <> '' then begin
                                    salesLine.Validate(Description, Rec.Description);
                                end else
                                    salesLine.Validate(Description, item.Description);
                                salesLine.Insert(true);
                                Rec."Sales Invoice Cretaed" := true;
                                Rec."Error Description" := '';
                            end;
                        end else begin
                            Message('Item Not Found');
                            Rec."Error Description" := 'Item Not Found';
                        end;
                    end;
                end else begin
                    Message('Customer Not Found');
                    Rec."Error Description" := 'Customer Not Found';
                end;
            end
            else
                Message('Sales Invoice Already created for this EDH ID %1', Rec."EDH ID");
        end;
        Rec.Modify(true);
    end;
}