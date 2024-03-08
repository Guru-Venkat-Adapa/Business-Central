tableextension 50103 CustomerExt extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50101; BlobText; Blob)
        {
            DataClassification = CustomerContent;
        }
    }

    procedure SetBlobValue(NewWorkDescription: Text; rec: Record Customer)
    var
        OutStream: OutStream;
    begin
        Clear(rec."BlobText");
        rec.BlobText.CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(NewWorkDescription);
        rec.Modify(true);
    end;

    procedure GetBlobValue(): Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        CalcFields(BlobText);
        BlobText.CreateInStream(InStream, TEXTENCODING::UTF8);
        exit(TypeHelper.ReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator));
    end;
}