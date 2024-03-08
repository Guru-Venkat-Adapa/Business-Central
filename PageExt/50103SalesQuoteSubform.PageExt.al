pageextension 50103 SalesQuoteSubformExt extends "Sales Quote Subform"
{
    layout
    {
        // Add changes to page layout here
    }


    actions
    {
        // Add changes to page actions here
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        salesorder: Record "Sales Header";
        salesline: Record "Sales Line";
        Salesprice: Record "Sales Price";
    begin
        salesline.SetRange("Document No.", Rec."Document No.");
        if salesline.FindSet() then begin
            if salesline."Line No." <> 0 then
                SetSalesOdrerProgress(Rec."Document No.", salesorder.Progress::InProcess);
        end;
    end;




    procedure SetSalesOdrerProgress(document: Code[20]; newenum: Enum SalesProcess)
    var
        salesorder: Record "Sales Header";
    begin
        salesorder.SetRange("No.", document);
        if salesorder.FindSet() then begin
            salesorder.Progress := newenum::InProcess;
            salesorder.Modify();
        end;
    end;
}