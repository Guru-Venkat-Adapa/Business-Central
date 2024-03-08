pageextension 50105 CustomerCardExt extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
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
                    trigger OnValidate()
                    var
                        sales: Record Customer;
                    begin
                        Rec.SetBlobValue(BlobText, Rec);

                    end;
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        Customer: Record Customer;
    begin
        BlobText := Rec.GetBlobValue();
    end;

    var
        BlobText: Text;
        info: Report Check;
}