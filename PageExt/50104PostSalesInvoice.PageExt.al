pageextension 50104 PostedSaInvExt extends "Posted Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
        addafter(Closed)
        {
            field(Progress; Rec.Progress)
            {
                Caption = 'Sales Order Status';
                Editable = false;
                trigger OnValidate()
                begin
                    CurrPage.SalesOrderStatusBar.SetProgress(salesorder.Progress::posted);
                end;
            }
            usercontrol(SalesOrderStatusBar; SalesOrderStatusBar)
            {
                ApplicationArea = all;
                trigger IAmReady()
                begin
                    CurrPage.SalesOrderStatusBar.SetProgress(salesorder.Progress::posted);
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    // var
    //     salesOrder: Record "Sales Invoice Header";
    begin
        salesorder.SetRange("No.", Rec."No.");
        if salesorder.FindSet() then begin
            SetSalesOdrerProgress(Rec."No.", salesorder.Progress::posted);
            CurrPage.SalesOrderStatusBar.SetProgress(salesorder.Progress);
        end;
    end;

    var
        salesorder: Record "Sales Invoice Header";

    procedure SetSalesOdrerProgress(document: Code[20]; newenum: Enum SalesProcess)
    begin
        salesorder.SetRange("No.", document);
        if salesorder.FindSet() then begin
            salesorder.Progress := salesorder.Progress::posted;
            // salesorder.Modify();
        end;
    end;
}