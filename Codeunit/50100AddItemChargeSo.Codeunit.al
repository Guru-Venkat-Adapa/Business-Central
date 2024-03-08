codeunit 50100 ExtraLineSO
{
    [EventSubscriber(ObjectType::Page, Page::"Sales Order Subform", 'OnAfterValidateEvent', 'Quantity', false, false)]
    local procedure MyProcedure(var Rec: Record "Sales Line")
    var
        salesline: Record "Sales Line";
        number: Integer;
    begin
        ItemCharge.SetRange(ItemCharge.Item, Rec.Description);
        if ItemCharge.FindSet() then begin
            number := Rec."Line No.";
            repeat
                salesline.Init();
                salesline."Document Type" := Rec."Document Type";
                salesline."Document No." := Rec."Document No.";
                salesline."Line No." := number + 1;
                salesline.Type := salesline.Type::"Charge (Item)";
                salesline."No." := ItemCharge."No.";
                salesline.Description := ItemCharge.Description;
                salesline."Quantity" := (ItemCharge.ItemQty * Rec.Quantity) / 100;
                salesline.Insert(true);
                number := salesline."Line No.";
            until ItemCharge.Next() = 0;
        end;
    end;

    var
        IteMCharge: Record "Item Charge";
}