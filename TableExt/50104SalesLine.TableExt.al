tableextension 50104 SalesLineExt extends "Sales Line"
{
    fields
    {
        // Add changes to table fields here
        field(50100; TotalVAT1; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Total Excl. VAT';
        }
        modify("Amount Including VAT")
        {

            trigger OnAfterValidate()
            begin
                CheckCurrency();
            end;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }
    procedure CheckCurrency()
    var
        check: Boolean;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
    begin
        Rec.SetRange("Document Type", Rec."Document Type"::Order);
        Rec.SetRange("Document No.", Rec."Document No.");
        Rec.SetRange("Line No.", Rec."Line No.");
        Message('find data');
    end;
}