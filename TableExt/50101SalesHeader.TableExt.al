tableextension 50101 SalesHeaderExt extends "Sales Header"
{
    fields
    {
        // Add changes to table fields here
        field(50100; Progress; Enum SalesProcess)
        {
            DataClassification = CustomerContent;
        }
        field(50101; BlobText; Blob)
        {
            // DataClassification = CustomerContent;
            Caption = 'Blob Text';
        }
    }
    procedure SetBlobValue(NewWorkDescription: Text; rec: Record "Sales Header")
    var
        OutStream: OutStream;
    begin
        Clear(rec."BlobText");
        rec.BlobText.CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(NewWorkDescription);
        Rec.Modify(true);
    end;

    procedure GetBlobValue(): Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        Rec.CalcFields(BlobText);
        Rec.BlobText.CreateInStream(InStream, TEXTENCODING::UTF8);
        exit(TypeHelper.ReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator));
    end;

    procedure GetdataFromCus(rec: Record "Sales Header"): Text
    var
        cus: Record Customer;
        OutStream: OutStream;
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
        NewWorkDescription: Text;
    begin
        cus.SetRange("No.", Rec."Sell-to Customer No.");
        if cus.FindSet() then begin
            cus.CalcFields(BlobText);
            cus.BlobText.CreateInStream(InStream, TEXTENCODING::UTF8);
            NewWorkDescription := TypeHelper.ReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator);
            if NewWorkDescription <> '' then begin
                Clear(rec."BlobText");
                rec.BlobText.CreateOutStream(OutStream, TEXTENCODING::UTF8);
                OutStream.WriteText(NewWorkDescription);
                Rec.Modify(true);
            end;
            exit(NewWorkDescription);
        end;
    end;
}