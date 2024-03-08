page 50100 Locationlistdemo
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = LocationDemo;
    Caption = 'Demo Location List';

    layout
    {
        area(Content)
        {
            repeater(Control)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    Caption = 'Loction Code';
                }
                field(Name; Rec.Name)
                {
                    Caption = 'Location Name';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetData)
            {
                ApplicationArea = All;
                Caption = 'Get Location Data';
                trigger OnAction()
                begin
                    GetLocData();
                end;
            }
        }
    }
    procedure GetLocData();
    var
        loc: Record Location;
        demoloc: Record LocationDemo;
    begin
        if loc.FindSet() then begin
            repeat
                if not demoloc.Get(loc.Code) then begin
                    demoloc.Init();
                    demoloc.Code := loc.Code;
                    demoloc.Name := loc.Name;
                    demoloc.Insert(true);
                end else
                    Message('Record already exists');
            until loc.Next() = 0;
        end;
    end;

}