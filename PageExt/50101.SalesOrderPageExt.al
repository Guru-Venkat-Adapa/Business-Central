pageextension 50101 "Sales Order" extends "Sales Order"
{
    layout
    {
        addafter("Work Description")
        {
            field(Progress; Rec.Progress)
            {
                Caption = 'Sales Order Status';
                ApplicationArea = all;
                Editable = false;
                trigger OnValidate()
                begin
                    CurrPage.SalesOrderStatusBar.SetProgress(Rec.Progress);
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
        addafter(Status)
        {
            group("Blob Text")
            {
                Caption = 'Blob Text';
                field(BlobText; BlobText)
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    MultiLine = true;
                    ShowCaption = false;
                    ToolTip = 'Specifies the products or service being offered.';

                    trigger OnValidate()
                    var
                        sales: Record "Sales Header";
                    begin
                        sales.SetFilter("Document Type", sales."No.");
                        sales.SetBlobValue(BlobText, Rec);
                    end;
                }
            }

        }
    }
    actions
    {
        addfirst(processing)
        {
            action(Report)
            {
                Caption = 'Generate Report';
                Promoted = true;
                PromotedCategory = New;
                Image = Report;
                ApplicationArea = All;
                // PromotedIsBig = true;

                trigger OnAction()
                var
                    SalesReport: Report SalesOrderAction;
                begin
                    Rec.SetFilter("No.", Rec."No.");
                    SalesReport.SetTableView(Rec);
                    SalesReport.Run();
                end;
            }
        }
        modify(Release)
        {
            trigger OnAfterAction()
            begin
                Rec.Progress := Rec.Progress::Release;
                rec.Modify(true);
                CurrPage.SalesOrderStatusBar.SetProgress(Rec.Progress::Release);
            end;
        }
        modify(Reopen)
        {
            trigger OnBeforeAction()
            begin
                CurrPage.SalesOrderStatusBar.SetProgress(Rec.Progress::SalesOrder);
            end;
        }
    }

    // Progress Bar functionalites
    // trigger OnAfterGetRecord()
    // var
    //     sales: Record "Sales Header";
    //     cus: Record Customer;
    // begin
    //     Rec.SetRange("No.", xRec."No.");
    //     if not sales.FindSet() then
    //         CurrPage.SalesOrderStatusBar.SetProgress(Rec.Progress::SalesOrder);
    // end;

    trigger OnAfterGetCurrRecord()
    var
        cus: Record Customer;
        sales: Record "Sales Header";
        val: Text;
        saleline: Record "Sales Line";
    begin
        // cus.SetRange("No.", Rec."Sell-to Customer No.");
        // if cus.FindSet() then begin
        val := Rec.GetBlobValue();
        if val = '' then begin
            BlobText := Rec.GetdataFromCus(Rec);
        end else begin
            BlobText := val;
            // Rec.Modify(true);
        end;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        salesorder.SetRange("No.", Rec."No.");
        if salesorder.FindSet() then begin
            if Rec."Sell-to Customer No." <> '' then begin
                Rec.Progress := Rec.Progress::SalesOrder;
                CurrPage.SalesOrderStatusBar.SetProgress(Rec.Progress::SalesOrder);
                // Rec.Modify(true);
            end;
        end;
    end;

    trigger OnOpenPage()
    var
        salesorder: Record "Sales Header";
    begin
        salesorder.SetRange("No.", Rec."No.");
        if salesorder.FindSet() then begin
            if Rec."Sell-to Customer No." <> '' then begin
                Rec.Progress := Rec.Progress::SalesOrder;
                Rec.Modify(true);
            end else
                Rec.Progress := 0;
        end;
        // else
    end;

    procedure SetSalesOdrerProgress(document: Code[20]; newenum: enum SalesProcess)
    begin
        salesorder.SetRange("No.", document);
        if salesorder.FindSet() then begin
            if salesorder.Status = Rec.Status::Open then begin
                salesorder.Progress := salesorder.Progress::SalesOrder;
                salesorder.Modify();
            end else
                if salesorder.Status = Rec.Status::Released then begin
                    salesorder.Progress := salesorder.Progress::Release;
                    salesorder.Modify();
                end;
        end;
    end;

    var
        salesorder: Record "Sales Header";
        BlobText: Text;
}

