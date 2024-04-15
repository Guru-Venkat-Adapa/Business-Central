page 50103 "API DEMO NZ_AU Card Page"
{
    PageType = Card;
    Caption = 'API DEMO NZ_AU Card';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "API NZ-AU";
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Response Code"; Rec."Response Code")
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
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}