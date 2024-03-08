table 50100 LocationDemo
{
    DataClassification = ToBeClassified;
    Caption = 'Location Demo';
    fields
    {
        field(1; Code; Code[100])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Pk; Code)
        {
            Clustered = true;
        }
    }
}