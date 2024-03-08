report 50100 SalesOrderAction
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Sales Order Action Report';
    DefaultLayout = RDLC;
    RDLCLayout = 'SalesOrderAction.RDL';
    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.";

            column(No_; "No.") { }
            column(Sell_to_Customer_Name; "Sell-to Customer Name") { }
            column(Document_Type; "Document Type") { }
            column(Sell_to_Address; "Sell-to Address") { }
            column(Amount; Amount) { }
            column(amountval; amountval[2]) { }
            column(amountval1; amountval[1]) { }

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemTableView = sorting("Document Type", "Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");
                column(SalesLIneNo_; "No.") { }
                column(SalesLineDocument_Type; "Document Type") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }

                dataitem(Integer; Integer)
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    column(CompanyName; CompanyProperty.DisplayName()) { }

                }
                trigger OnAfterGetRecord()
                var
                    info: report "Commercial Invoice";
                    amountdec: Decimal;
                begin
                    // amountdec := Round(Amount, 0.01);
                    info.InitTextVariable();
                    info.FormatNoText(amountval, Amount, "Sales Header"."Currency Code");
                    AmountWord := amountval[1];
                end;

            }
        }
    }

    var
        AmountWord: text;
        amountval: array[2] of Text[80];

}