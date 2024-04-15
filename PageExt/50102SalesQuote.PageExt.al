pageextension 50102 SalesQuoteExt extends "Sales Quote"
{
    layout
    {
        // Add changes to page layout here
        addafter(Status)
        {
            field(Progress; Rec.Progress)
            {
                Caption = 'Sales Order Status';
                ApplicationArea = all;
                Editable = false;
                trigger OnValidate()
                begin
                    CurrPage.SalesOrderStatusBar.SetProgress(Rec. Progress);
                end;
            }
            usercontrol(SalesOrderStatusBar; SalesOrderStatusBar)
            {
                ApplicationArea = all;
                trigger IAmReady()
                begin
                    CurrPage.SalesOrderStatusBar.SetProgress(Rec.Progress);
                end;
            }
        }
    }
    actions
    {
        // modify(MakeOrder)
        // {
        //     // Visible = false;
        // }
        // addbefore(MakeInvoice)
        // {
        //     action(CustomMakeOrder)
        //     {
        //         ApplicationArea = Basic, Suite;
        //         Caption = 'Make &Order';
        //         Image = MakeOrder;
        //         Promoted = true;
        //         PromotedCategory = Process;
        //         PromotedIsBig = true;
        //         ToolTip = 'Convert the sales quote to a sales order.Guru Venkat';

        //         trigger OnAction()
        //         var
        //             ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        //         // runResult: Boolean;
        //         begin
        //             if ApprovalsMgmt.PrePostApprovalCheckSales(Rec) then
        //                 CODEUNIT.Run(CODEUNIT::"Sales-Quote to Order", Rec);
        //             // if runResult then begin
        //             // if Codeunit.Run(Codeunit::"Sales-Quote to Order (Yes/No)")= Action::Yes then begin
        //             SetSalesOrder(Rec."No.", salesorder, salesorder.Progress::SalesOrder);
        //             // end;
        //             // CurrPage.SalesOrderStatusBar.SetProgress(salesorder.Progress::SalesOrder);
        //         end;
        //     }
        // }
    }
    trigger OnAfterGetRecord()
    var
        salesorder: Record "Sales Header";
    begin
        salesorder.SetRange("No.", xRec."No.");
        if Rec."Sell-to Customer No." <> '' then begin
            // SetSalesOdrerProgress(Rec."No.", salesorder.Progress::Created);
            // if Rec.Progress = Rec.Progress::InProcess then begin
            //     SetSalesOdrerProgress(Rec."No.", salesorder.Progress::InProcess);
            //     CurrPage.SalesOrderStatusBar.SetProgress(Rec.Progress::InProcess);
            // end else
            //     if salesorder.Progress = 0 then begin
            //         SetSalesOdrerProgress(Rec."No.", salesorder.Progress::Created);
            //         CurrPage.SalesOrderStatusBar.SetProgress(Rec.Progress::Created);
            //         salesorder.Progress := salesorder.Progress::InProcess;
            //     end;
            if Rec.FindSet() then begin
                if Rec.Progress = 0 then begin
                    Rec.Progress := Rec.Progress::Created;
                    CurrPage.SalesOrderStatusBar.SetProgress(Rec.Progress::Created);
                end else
                    if rec.Progress = Rec.Progress::InProcess then
                        CurrPage.SalesOrderStatusBar.SetProgress(Rec.Progress::InProcess);
            end;
        end;
    end;

    procedure SetSalesOdrerProgress(document: Code[20]; newenum: Enum SalesProcess)
    var
        salesorder: Record "Sales Header";
    begin
        salesorder.SetRange("No.", document);
        if salesorder.FindSet() then begin
            if salesorder.Progress = 0 then begin
                salesorder.Progress := newenum::Created;
                salesorder.Modify();
            end else
                if salesorder.Progress = Rec.Progress::Created then begin
                    salesorder.Progress := newenum::InProcess;
                    salesorder.Modify();
                end;
        end;
    end;

    var
        salesorder: Record "Sales Header";

    procedure SetSalesOrder(document: Code[20]; var salesorder: Record "Sales Header"; newenum: Enum SalesProcess)
    begin
        salesorder.SetRange("No.", document);
        if salesorder.FindSet() then begin
            salesorder.Progress := newenum::SalesOrder;
            salesorder.Modify();
        end;
    end;
}