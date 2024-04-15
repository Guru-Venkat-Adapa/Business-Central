page 50102 API
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "API NZ-AU";
    CardPageId = "API DEMO NZ_AU Card Page";

    layout
    {
        area(Content)
        {
            repeater(Control)
            {
                // field("No."; Rec."No.")
                // {
                //     ApplicationArea = All;
                // }
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = All;
                }
                // field("Pirc Amt Currency"; Rec."Pirc Amt Currency")
                // {
                //     ApplicationArea = All;
                // }
                // field("Pric Amt Amount"; Rec."Pric Amt Amount")
                // {
                //     ApplicationArea = All;
                // }
                // field("Pric Amt Display Amt"; Rec."Pric Amt Display Amt")
                // {
                //     ApplicationArea = All;
                // }
                // field("SC Amt Currency"; Rec."SC Amt Currency")
                // {
                //     ApplicationArea = All;
                // }
                // field("SC Amt Amount"; Rec."SC Amt Amount")
                // {
                //     ApplicationArea = All;
                // }
                // field("SC Amt Display Amt"; Rec."SC Amt Display Amt")
                // {
                //     ApplicationArea = All;
                // }
                // field("TotalAmt Currency"; Rec."TotalAmt Currency")
                // {
                //     ApplicationArea = All;
                // }
                // field("TotalAmt Amount"; Rec."TotalAmt Amount")
                // {
                //     ApplicationArea = All;
                // }
                // field("TotalAmt Display Amt"; Rec."TotalAmt Display Amt")
                // {
                //     ApplicationArea = All;
                // }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Response Code"; Rec."Response Code")
                {
                    ApplicationArea = All;
                }
                field("Response Description"; Rec."Response Description")
                {
                    ApplicationArea = All;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = All;
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                    ApplicationArea = All;
                }
                field("Settlement Date"; Rec."Settlement Date")
                {
                    ApplicationArea = All;
                }
                field(Source; Rec.Source)
                {
                    ApplicationArea = All;
                }
                field("Customer Ref No."; Rec."Customer Ref No.")
                {
                    ApplicationArea = All;
                }
                field(User; Rec.User)
                {
                    ApplicationArea = All;
                }
                field(Refundable; Rec.Refundable)
                {
                    ApplicationArea = All;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                }
                field("IP Address"; Rec."IP Address")
                {
                    ApplicationArea = All;
                }
                field("Debate Repayment"; Rec."Debate Repayment")
                {
                    ApplicationArea = All;
                }
                field("Supplier Business Code"; Rec."Supplier Business Code")
                {
                    ApplicationArea = All;
                }
                // field("CCard Account Type"; Rec."CCard Account Type")
                // {
                //     ApplicationArea = All;
                // }
                // field("CCard Account Token"; Rec."CCard Account Token")
                // {
                //     ApplicationArea = All;
                // }
                // field("CCard Customer ID"; Rec."CCard Customer ID")
                // {
                //     ApplicationArea = All;
                // }
                // field("CCard Default Account"; Rec."CCard Default Account")
                // {
                //     ApplicationArea = All;
                // }
                // field("CCard Card Number"; Rec."CCard Card Number")
                // {
                //     ApplicationArea = All;
                // }
                // field("CCard Expiry Month"; Rec."CCard Expiry Month")
                // {
                //     ApplicationArea = All;
                // }
                // field("CCard Expiry Year"; Rec."CCard Expiry Year")
                // {
                //     ApplicationArea = All;
                // }
                // field("CCard Card Scheme"; Rec."CCard Card Scheme")
                // {
                //     ApplicationArea = All;
                // }
                // field("CCard Card Holder Name"; Rec."CCard Card Holder Name")
                // {
                //     ApplicationArea = All;
                // }
                // field("CCard Card Type"; Rec."CCard Card Type")
                // {
                //     ApplicationArea = All;
                // }
                // field("CCard Master Card Number"; Rec."CCard Master Card Number")
                // {
                //     ApplicationArea = All;
                // }
                // field("CCard Pan Type"; Rec."CCard Pan Type")
                // {
                //     ApplicationArea = All;
                // }
                // field("MA Marchant ID"; Rec."MA Marchant ID")
                // {
                //     ApplicationArea = All;
                // }
                // field("MA Marchant Name"; Rec."MA Marchant Name")
                // {
                //     ApplicationArea = All;
                // }
                // field("MA Display Name"; Rec."MA Display Name")
                // {
                //     ApplicationArea = All;
                // }
                // field("MA Acquiring"; Rec."MA Acquiring")
                // {
                //     ApplicationArea = All;
                // }
                // field("MA Currency"; Rec."MA Currency")
                // {
                //     ApplicationArea = All;
                // }
                field("Pay To Data"; Rec."Pay To Data")
                {
                    ApplicationArea = All;
                }
                field("Pay To Payee Account"; Rec."Pay To Payee Account")
                {
                    ApplicationArea = All;
                }
                field("Pay To Payer Account"; Rec."Pay To Payer Account")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(New)
            {
                ApplicationArea = All;
                Caption = 'Check Api';

                trigger OnAction()
                var
                    code: Codeunit "API PRoject NZ_AU";
                begin
                    code.GetAPI('https://api.quickstream.support.qvalent.com/rest/v1/transactions', 'C01280_SEC_4p8mkfznixvytm926cwieaec5dpixc3k88u5gacard5a6ue5yhjejzq5peg4', '');
                end;
            }
            action(WriteAPI)
            {
                ApplicationArea = All;
                Caption = 'Write API Data ';

                trigger OnAction()
                var
                    code: Codeunit "API PRoject NZ_AU";
                begin
                    code.WriteAPI('https://api.quickstream.support.qvalent.com/rest/v1/transactions', 'C01280_SEC_4p8mkfznixvytm926cwieaec5dpixc3k88u5gacard5a6ue5yhjejzq5peg4', '');
                end;
            }
        }
    }

    var
        myInt: Integer;
}