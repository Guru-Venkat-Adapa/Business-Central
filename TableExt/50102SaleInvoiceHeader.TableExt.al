tableextension 50102 SalesInvHeadExt extends "Sales Invoice Header"
{
    fields
    {
        // Add changes to table fields here
        field(50100; Progress; Enum SalesProcess)
        {
            DataClassification = CustomerContent;
        }
    }
}