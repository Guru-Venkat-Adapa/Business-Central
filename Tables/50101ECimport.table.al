table 50101 "EC import"
{
    DataClassification = ToBeClassified;
    Caption = 'EC import';
    fields
    {
        field(1; "EDH ID"; text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'EDH ID';
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Kundennummer ';
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(3; "Customer sync ID"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer sync ID';
        }
        field(4; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(5; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
        field(6; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Amount';
        }
        field(7; "EDH Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'EDH Date';
        }
        field(8; URL; Text[250])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
            Caption = 'URL';
        }
        field(9; "Error Description"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Error Description';
        }
        field(10; "Sales Invoice Cretaed"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Sales Invoice Created';
        }
    }

    keys
    {
        key(PK; "EDH ID", "Item No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}