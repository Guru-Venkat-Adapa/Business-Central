page 50102 MyPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sales Header";

    layout
    {
        area(Content)
        {
            // group(GroupName)
            // {
            //     field(Name; NameSource)
            //     {
            //         ApplicationArea = All;

            //     }
            // }
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
        }
    }

    var
        myInt: Integer;
}