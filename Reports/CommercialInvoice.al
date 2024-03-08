report 50101 "Commercial Invoice"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Layout/CommercialInvoice.rdl';
    Caption = 'Commercial Invoice';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            CalcFields = Amount, "Amount Including VAT", "Invoice Discount Amount";
            RequestFilterFields = "No.";
            column(Comp_Name; RecComp.Name)
            { }
            column(Comp_Add; RecComp.Address)
            { }
            column(Comp_Add2; RecComp."Address 2")
            { }
            column(Comp_CITY; RecComp.City)
            { }
            column(Comp_POSTCODE; RecComp."Post Code")
            { }
            column(Comp_GST; RecComp."VAT Registration No.")
            { }
            column(Comp_COMPREGIST; RecComp."Registration No.")
            { }
            column(Comp_Web; RecComp."Home Page")
            { }
            column(Comp_Email; RecComp."E-Mail")
            { }
            column(Comp_Picture; RecComp.Picture)
            { }
            column(Comp_Phn; RecComp."Phone No.")
            { }
            column(Comp_FAX; RecComp."Fax No.")
            { }
            column(Type; Type)
            { }
            column(AmountIncludingVAT; "Sales Header"."Amount Including VAT")
            { }
            column(No_; "No.")
            { }
            column(ShowBankInfo; ShowBankInfo)
            { }
            column(ShowLotNoInfo; ShowLotNoInfo)
            { }
            column(ShowPortInfo; ShowPortInfo)
            { }
            column(ShowTermCond; ShowTermCond)
            { }
            column(TermsConditons; TermsConditons)
            { }
            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);
                DataItemLinkReference = "Sales Header";
                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(Title; Title)
                    { }
                    column(OutputNo; OutputNo)
                    { }
                    // column(ExistingPlantSN; "Sales Header"."Existing Project Serial No.")
                    // { }
                    column(CurrencyCode; CurrencyCode)
                    { }
                    column(OrderNo_SalesInvoiceHeader; "Sales Header"."No.")
                    { }

                    column(PostingDate_SalesInvoiceHeader; "Sales Header"."Posting Date")
                    { }
                    column(SalespersonCode_SalesInvoiceHeader; RecSalesPerson.Name)
                    { }
                    column(RecShippingMethod_Desc; RecShippingMethod.Description)
                    { }
                    column(Desiredshippingdate_SalesHeader; "Sales Header"."Requested Delivery Date")
                    { }
                    column(PaymentTermsCode_SalesInvoiceHeader; RecPaymentTerm.Description)
                    { }
                    column(No_SalesInvoiceHeader; "Sales Header"."No.")
                    { }
                    column(CustomerPONo; "Sales Header"."External Document No.")
                    { }
                    column(ProjectCode; "Sales Header"."Shortcut Dimension 1 Code")
                    { }
                    // column(PortofLoading; "Sales Header"."Port of Loading")
                    // { }
                    // column(PortofDischarge; "Sales Header"."Port of Discharge")
                    // { }
                    // column(AWBBLNo; "Sales Header"."BL/AWB No.")
                    // { }
                    // column(vesselName; "Sales Header"."Name of Vessel")
                    // { }
                    column(PageCaptionCap; PageCaptionCap)
                    { }
                    column(VatPerc; "Sales Line"."VAT %")
                    { }
                    column(VatAmount; "Sales Header"."Amount Including VAT" - "Sales Header".Amount)
                    { }
                    column(BankAddr1; BankAddr[1])
                    { }
                    column(BankAddr2; BankAddr[2])
                    { }
                    column(BankAddr3; BankAddr[3])
                    { }
                    column(BankAddr4; BankAddr[4])
                    { }
                    column(BankAddr5; BankAddr[5])
                    { }
                    column(BankAddr6; BankAddr[6])
                    { }
                    column(BankAddr7; BankAddr[7])
                    { }
                    column(BankAddr8; BankAddr[8])
                    { }
                    column(AmountInWords1; AmountInWords[1])
                    { }
                    column(AmountInWords2; AmountInWords[2])
                    { }
                    column(CurrencyFactor; CurrencyFac)
                    { }
                    column(CurrencyFctorSalesInvHeader; "Sales Header"."Currency Code")
                    { }
                    column(LCYWithOutGST; LCYWithOutGST)
                    { }
                    column(LCYWithGST; LCYWithGST)
                    { }
                    column(LCYGST; LCYGST)
                    { }
                    column(LCYCurrencyCode; LCYCurrencyCode)
                    { }
                    column(InvoiceDiscountAmount; "Sales Header"."Invoice Discount Amount")
                    { }
                    column(LCYDiscAmt; LCYDiscAmt)
                    { }
                    column(SellAddr1; SellAddr[1])
                    { }
                    column(SellAddr2; SellAddr[2])
                    { }
                    column(SellAddr3; SellAddr[3])
                    { }
                    column(SellAddr4; SellAddr[4])
                    { }
                    column(SellAddr5; SellAddr[5])
                    { }
                    column(SellAddr6; SellAddr[6])
                    { }
                    column(SellAddr7; SellAddr[7])
                    { }
                    column(SellAddr8; SellAddr[8])
                    { }
                    column(BillAddr1; BillAddr[1])
                    { }
                    column(BillAddr2; BillAddr[2])
                    { }
                    column(BillAddr3; BillAddr[3])
                    { }
                    column(BillAddr4; BillAddr[4])
                    { }
                    column(BillAddr5; BillAddr[5])
                    { }
                    column(BillAddr6; BillAddr[6])
                    { }
                    column(BillAddr7; BillAddr[7])
                    { }
                    column(BillAddr8; BillAddr[8])
                    { }
                    column(ShipAddr1; ShipAddr[1])
                    { }
                    column(ShipAddr2; ShipAddr[2])
                    { }
                    column(ShipAddr3; ShipAddr[3])
                    { }
                    column(ShipAddr4; ShipAddr[4])
                    { }
                    column(ShipAddr5; ShipAddr[5])
                    { }
                    column(ShipAddr6; ShipAddr[6])
                    { }
                    column(ShipAddr7; ShipAddr[7])
                    { }
                    column(ShipAddr8; ShipAddr[8])
                    { }
                    dataitem("Sales Line"; "Sales Line")
                    {
                        DataItemLinkReference = "Sales Header";
                        DataItemLink = "Document No." = FIELD("No.");
                        column(No_SalesInvoiceLine; "Sales Line"."No.") { }
                        column(Description_SalesInvoiceLine; "Sales Line".Description) { }
                        column(Description2_SalesInvoiceLine; "Sales Line"."Description 2") { }
                        column(UnitofMeasure_SalesInvoiceLine; "Sales Line"."Unit of Measure Code") { }
                        column(LineNo_SalesInvoiceLine; "Sales Line"."Line No.") { }
                        column(Quantity_SalesInvoiceLine; "Sales Line".Quantity) { }
                        column(Unit_Price; "Sales Line"."Unit Price") { }
                        column(LineDiscount_SalesInvoiceLine; "Sales Line"."Line Discount %") { }
                        column(Amount_SalesInvoiceLine; "Sales Line".Amount) { }
                        column(LineAmount_SalesInvoiceLine; "Sales Line"."Line Amount") { }
                        column(UnitofMeasureCode_SalesInvoiceLine; "Sales Line"."Unit of Measure Code") { }
                        column(SrNo; SrNo) { }
                        column(LotNo; LotNo) { }
                        column(SerialNo; SerialNo) { }
                        // column(HS_Code; "HS Code") { }
                        column(Type_Line; Type)
                        { }
                        column(Itec_Var; Itec_Var.Type)
                        { }



                        trigger OnAfterGetRecord()
                        begin



                            RecItemLegEntry.Reset();
                            RecItemLegEntry.SetRange("Item No.", "Sales Line"."No.");
                            RecItemLegEntry.SetRange("Document Line No.", "Sales Line"."Line No.");
                            RecItemLegEntry.SetRange("Entry Type", RecItemLegEntry."Entry Type"::Sale);
                            RecItemLegEntry.SetRange("Source No.", "Sales Header"."Sell-to Customer No.");
                            if RecItemLegEntry.FindLast() then begin
                                LotNo := RecItemLegEntry."Lot No.";
                                SerialNo := RecItemLegEntry."Serial No.";
                            end;

                            Itec_Var.Reset();
                            Itec_Var.SetRange("No.", "Sales Line"."No.");
                            Itec_Var.SetFilter(Type, '%1', Itec_Var.type::Service);
                            if Itec_Var.FindFirst() then;

                            if ("Sales Line"."No." <> '') and ("Sales Line".Type = "Sales Line".Type::Item) and ("Sales Line".Quantity <> 0) and (Itec_Var.Type <> Itec_Var.Type::Service) then begin
                                SrNo += 1;
                            end;

                        end;

                        trigger OnPreDataItem()
                        begin
                            SrNo := 0;
                            ShowItemCode := true;
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    IF Number > 0 THEN BEGIN
                        CopyText := Text16502;
                        OutputNo += 1;

                        IF (OutputNo = 1) AND (Type <> Type::" ") then
                            Title := FORMAT(Type)
                        ELSE
                            Title := Text1;

                        IF OutputNo = 2 THEN BEGIN
                            Title := Text2;
                        END;

                        IF OutputNo = 3 THEN BEGIN
                            Title := Text3;
                        END;
                    END;

                    //Amount In Words
                    "Sales Header".CALCFIELDS("Sales Header"."Amount Including VAT");
                    InitTextVariable;
                    FormatNoText(AmountInWords, "Sales Header"."Amount Including VAT", CurrencyCode);
                    AmountInWords[1] := UpperCase(AmountInWords[1]);
                    lTxt := COPYSTR(AmountInWords[1], 1, 1);
                    lTxt := UPPERCASE(lTxt);
                    lTxt := lTxt + COPYSTR(AmountInWords[1], 2);
                    AmountInWords[1] := lTxt;

                    //Calculate GST for Local currency
                    CLEAR(LCYWithOutGST);
                    CLEAR(LCYWithGST);
                    CLEAR(CurrencyFac);
                    "Sales Header".CalcFields(Amount);
                    IF "Sales Header"."Currency Code" <> '' THEN BEGIN
                        IF "Sales Header"."Currency Factor" <> 0 THEN BEGIN
                            CurrencyFac := 1 / "Sales Header"."Currency Factor";
                            CurrencyFac := Round(CurrencyFac, 0.0001, '>');

                            LCYWithOutGST := "Sales Header".Amount / "Sales Header"."Currency Factor";
                            LCYWithOutGST := Round(LCYWithOutGST, 0.00001, '>');

                            LCYWithGST := "Sales Header"."Amount Including VAT" / "Sales Header"."Currency Factor";
                            LCYWithGST := Round(LCYWithGST, 0.00001, '>');

                            LCYGST := ("Sales Header"."Amount Including VAT" - "Sales Header".Amount) / "Sales Header"."Currency Factor";
                            LCYGST := Round(LCYGST, 0.0001, '>');

                            LCYDiscAmt := "Sales Header"."Invoice Discount Amount" / "Sales Header"."Currency Factor";
                            LCYDiscAmt := Round(LCYDiscAmt, 0.0001, '>');
                        END;
                    END;

                    //Bank Detail
                    /*if "Sales Header"."Bank Account No." = '' then begin
                        BankAddr[1] := 'Bank Name : ' + RecComp."Bank Name";
                        BankAddr[2] := 'Bank A/C No. : ' + RecComp."Bank Account No.";
                        BankAddr[3] := 'Bank Address : ';
                        BankAddr[4] := '';
                        BankAddr[5] := '';
                        BankAddr[6] := '';
                        BankAddr[7] := 'Branch Code : ' + RecComp."Bank Branch No.";
                        BankAddr[8] := 'SWIFT Code : ' + RecComp."SWIFT Code";
                    end else begin*/
                    RecBank.Reset();
                    // RecBank.SetRange("No.", "Sales Header"."Bank Account");
                    if RecBank.FindFirst then begin
                        BankAddr[1] := 'Bank Name : ' + RecBank.Name;
                        BankAddr[2] := 'Bank A/C No. : ' + RecBank."Bank Account No.";
                        BankAddr[3] := 'Bank Address : ' + RecBank.Address;
                        BankAddr[4] := RecBank."Address 2";
                        if RecBank.City <> '' then
                            BankAddr[5] := RecBank.City + ' ' + RecBank."Post Code"
                        else
                            BankAddr[5] := RecBank.City;

                        BankAddr[6] := 'Bank Code : ' + RecBank."No.";
                        BankAddr[7] := 'Branch Code : ' + RecBank."Bank Branch No.";
                        BankAddr[8] := 'SWIFT Code : ' + RecBank."SWIFT Code";
                        CompressArray(BankAddr);

                    end;
                    //end;

                    RecCust.Reset();
                    if RecCust.get("Sales Header"."Bill-to Customer No.") then;



                    //Sell-to custome Detail
                    SellAddr[1] := "Sales Header"."Sell-to Customer Name";
                    SellAddr[2] := "Sales Header"."Sell-to Contact";
                    SellAddr[3] := "Sales Header"."Sell-to Address";
                    SellAddr[4] := "Sales Header"."Sell-to Address 2";
                    if "Sales Header"."Sell-to City" <> '' then
                        SellAddr[5] := "Sales Header"."Sell-to City" + ' ' + "Sales Header"."Sell-to Post Code"
                    else
                        SellAddr[5] := "Sales Header"."Sell-to City";
                    SellAddr[6] := "Sales Header"."Sell-to County";
                    if RecCust."Phone No." <> '' then
                        SellAddr[7] := 'TEL:' + "Sales Header"."Sell-to Phone No."
                    else
                        SellAddr[7] := "Sales Header"."Sell-to Phone No.";
                    if RecCust."Fax No." <> '' then
                        SellAddr[8] := 'FAX:' + RecCust."Fax No."
                    else
                        SellAddr[8] := RecCust."Fax No.";


                    CompressArray(SellAddr);
                    //Bill-to customer Detail


                    BillAddr[1] := "Sales Header"."Bill-to Name";
                    BillAddr[2] := "Sales Header"."Bill-to Contact";
                    BillAddr[3] := "Sales Header"."Bill-to Address";
                    BillAddr[4] := "Sales Header"."Bill-to Address 2";
                    if "Sales Header"."Bill-to City" <> '' then
                        BillAddr[5] := "Sales Header"."Bill-to City" + ' ' + "Sales Header"."Bill-to Post Code"
                    else
                        BillAddr[5] := "Sales Header"."Bill-to City";

                    BillAddr[6] := "Sales Header"."Bill-to County";
                    if RecCust."Phone No." <> '' then
                        BillAddr[7] := 'TEL:' + RecCust."Phone No."
                    else
                        BillAddr[7] := "Sales Header"."Sell-to Phone No.";
                    if RecCust."Fax No." <> '' then
                        BillAddr[8] := 'FAX:' + RecCust."Fax No."
                    else
                        BillAddr[8] := RecCust."Fax No.";
                    CompressArray(BillAddr);

                    //Ship-to Customer Detail

                    RecshipToAdd.Reset();
                    RecshipToAdd.SetRange(RecshipToAdd.Code, "Sales Header"."Ship-to Code");
                    if RecshipToAdd.FindFirst() then;

                    ShipAddr[1] := "Sales Header"."Ship-to Name";
                    ShipAddr[2] := "Sales Header"."Ship-to Contact";
                    ShipAddr[3] := "Sales Header"."Ship-to Address";
                    ShipAddr[4] := "Sales Header"."Ship-to Address 2";
                    if "Sales Header"."Ship-to City" <> '' then
                        ShipAddr[5] := "Sales Header"."Ship-to City" + ' ' + "Sales Header"."Ship-to Post Code"
                    else
                        ShipAddr[5] := "Sales Header"."Ship-to City";
                    ShipAddr[6] := "Sales Header"."Ship-to County";
                    if RecshipToAdd."Phone No." <> '' then
                        ShipAddr[7] := 'TEL:' + RecshipToAdd."Phone No."
                    else
                        ShipAddr[7] := RecshipToAdd."Phone No.";
                    if RecshipToAdd."Fax No." <> '' then
                        ShipAddr[8] := 'FAX:' + RecshipToAdd."Fax No."
                    else
                        ShipAddr[8] := RecshipToAdd."Fax No.";

                    CompressArray(ShipAddr);

                    if "Sales Header"."Currency Code" <> '' then
                        CurrencyCode := "Sales Header"."Currency Code"
                    else
                        CurrencyCode := GLSetup."LCY Code";
                    RecShippingMethod.Reset();
                    RecShippingMethod.SetRange(Code, "Sales Header"."Shipment Method Code");
                    if RecShippingMethod.FindFirst() then;

                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := ABS(NoOfCopies);
                    //NoOfLoops := ABS(NoOfCopies) + 1;
                    IF NoOfLoops <= 1 THEN
                        NoOfLoops := 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);

                    OutputNo := 0;
                    //Title:='';
                end;
            }

            trigger OnAfterGetRecord()
            begin
                RecSalesPerson.RESET;
                RecSalesPerson.SETRANGE(RecSalesPerson.Code, "Sales Header"."Salesperson Code");
                IF RecSalesPerson.FINDFIRST THEN;

                RecPaymentTerm.RESET;
                RecPaymentTerm.SETRANGE(RecPaymentTerm.Code, "Sales Header"."Payment Terms Code");
                IF RecPaymentTerm.FINDFIRST THEN;

                GLSetup.get;
                LCYCurrencyCode := GLSetup."LCY Code";

                // TermsConditons := GetTermsCondition("Sales Header");
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        Caption = 'No. of Copies';
                        ApplicationArea = all;

                        trigger OnValidate()
                        begin
                            IF NoOfCopies > 1 THEN
                                Type := Type::" ";
                        end;
                    }
                    field(Type; Type)

                    {
                        Caption = 'Select Type';
                        Visible = false;
                    }
                    field(ShowBankInfo; ShowBankInfo)
                    {
                        Caption = 'Show Bank Info';
                        ApplicationArea = all;
                    }

                    field(ShowLotNoInfo; ShowLotNoInfo)
                    {
                        Caption = 'Show LotNo. Info';
                        ApplicationArea = all;
                    }
                    field(ShowTermCond; ShowTermCond)
                    {
                        Caption = 'Show Terms & Condition';
                        ApplicationArea = all;
                    }
                    field(ShowPortInfo; ShowPortInfo)
                    {
                        Caption = 'Show Port Info';
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            NoOfCopies := 0;
            Type := Type::" ";
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        RecComp.GET;
        RecComp.CALCFIELDS(Picture);
        RecSalesRec.GET;
        // RecSalesRec.CalcFields("Terms & Conditions");
        ShowBankInfo := true;
        ShowLotNoInfo := true;
        ShowQRCode := true;
        ShowPortInfo := true;
    end;

    var
        Itec_Var: Record 27;
        ShowItemCode: Boolean;
        RecShippingMethod: Record "Shipment Method";
        RecComp: Record "Company Information";
        SrNo: Integer;
        RecSalesPerson: Record "Salesperson/Purchaser";
        RecPaymentTerm: Record "Payment Terms";
        RecCust: Record Customer;
        RecshipToAdd: Record "Ship-to Address";
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OutputNo: Integer;
        Title: Text[50];
        RecSalesRec: Record "Sales & Receivables Setup";
        Text16502: Label 'COPY';
        Text1: Label 'Original Copy';
        Text2: Label 'Copy 1';
        Text3: Label 'Copy 2';
        PageCaptionCap: Label 'Page %1 of %2';
        Type: Option " ","Original Copy","Copy 1","Copy 2";
        CurrencyCode: Code[10];
        GLSetup: Record "General Ledger Setup";
        RecItemLegEntry: Record "Item Ledger Entry";
        LotNo: Code[50];
        SerialNo: Code[50];
        lTxt: Text;
        TempVATAmountLine: Record "VAT Amount Line" temporary;
        Text024: Label 'XXXX.XX';
        Text025: Label 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
        Text026: Label 'ZERO';
        Text027: Label 'HUNDRED';
        Text028: Label 'AND';
        Text029: Label '%1 results in a written number that is too long.';
        Text032: Label 'ONE';
        Text033: Label 'TWO';
        Text034: Label 'THREE';
        Text035: Label 'FOUR';
        Text036: Label 'FIVE';
        Text037: Label 'SIX';
        Text038: Label 'SEVEN';
        Text039: Label 'EIGHT';
        Text040: Label 'NINE';
        Text041: Label 'TEN';
        Text042: Label 'ELEVEN';
        Text043: Label 'TWELVE';
        Text044: Label 'THIRTEEN';
        Text045: Label 'FOURTEEN';
        Text046: Label 'FIFTEEN';
        Text047: Label 'SIXTEEN';
        Text048: Label 'SEVENTEEN';
        Text049: Label 'EIGHTEEN';
        Text050: Label 'NINETEEN';
        Text051: Label 'TWENTY';
        Text052: Label 'THIRTY';
        Text053: Label 'FORTY';
        Text054: Label 'FIFTY';
        Text055: Label 'SIXTY';
        Text056: Label 'SEVENTY';
        Text057: Label 'EIGHTY';
        Text058: Label 'NINETY';
        Text059: Label 'THOUSAND';
        Text060: Label 'MILLION';
        Text061: Label 'BILLION';
        OnesText: array[20] of Text[30];
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        AmountInWords: array[2] of Text[100];
        LCYWithOutGST: Decimal;
        LCYWithGST: Decimal;
        LCYGST: Decimal;
        CurrencyFac: Decimal;
        LCYCurrencyCode: Code[10];
        RecBank: Record 270;
        BankAddr: array[8] of Text;
        SellAddr: array[8] of Text;
        BillAddr: array[8] of Text;
        ShipAddr: array[8] of Text;
        ShowBankInfo: Boolean;
        ShowLotNoInfo: Boolean;
        ShowPortInfo: Boolean;
        LCYDiscAmt: Decimal;
        ShowQRCode: Boolean;
        ShowTermCond: Boolean;
        TermsConditons: Text;

    procedure FormatNoText(var NoText: array[2] of Text[80]; No: Decimal; Currency: Code[10])
    var
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
        DecimalPosition: Decimal;
        recCurrency: Record 4;
    begin
        CLEAR(NoText);
        NoTextIndex := 1;
        //NoText[1] := '****';
        NoText[1] := ' ';
        GLSetup.GET;//WIN345

        IF No < 1 THEN
            AddToNoText(NoText, NoTextIndex, PrintExponent, Text026)
        ELSE
            FOR Exponent := 4 DOWNTO 1 DO BEGIN
                PrintExponent := FALSE;
                Ones := No DIV POWER(1000, Exponent - 1);
                Hundreds := Ones DIV 100;
                Tens := (Ones MOD 100) DIV 10;
                Ones := Ones MOD 10;
                IF Hundreds > 0 THEN BEGIN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, Text027);
                END;
                IF Tens >= 2 THEN BEGIN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                    IF Ones > 0 THEN
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                END ELSE
                    IF (Tens * 10 + Ones) > 0 THEN
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                IF PrintExponent AND (Exponent > 1) THEN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
                No := No - (Hundreds * 100 + Tens * 10 + Ones) * POWER(1000, Exponent - 1);
            END;


        IF "Sales Header"."Currency Code" <> '' THEN
            recCurrency.GET("Sales Header"."Currency Code");
        //ELSE
        //recCurrency.GET(GLSetup."LCY Code");

        IF CurrencyCode <> '' THEN
            AddToNoText(NoText, NoTextIndex, PrintExponent, recCurrency.Code + ' ' + Text028)
        ELSE
            AddToNoText(NoText, NoTextIndex, PrintExponent, 'DOLLARS ' + Text028);//recCurrency."Currency Description"

        /*
        IF GLSetup."Amount Rounding Precision" <> 0 THEN
          DecimalPosition := 1 / GLSetup."Amount Rounding Precision"
        ELSE
          DecimalPosition := 1;
        */

        //for displaying cents
        No := No * 100;
        Tens := No DIV 10;
        Ones := No MOD 10;
        IF No < 1 THEN
            AddToNoText(NoText, NoTextIndex, PrintExponent, Text026)
        ELSE BEGIN
            IF Tens >= 2 THEN BEGIN
                AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                IF Ones > 0 THEN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
            END ELSE
                IF (Tens * 10 + Ones) > 0 THEN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
        END;
        //AddToNoText(NoText, NoTextIndex, PrintExponent, 'CENTS ONLY');


        //IF CurrencyCode <> '' THEN
        // AddToNoText(NoText, NoTextIndex, PrintExponent, recCurrency.Code + ' ONLY')
        // ELSE
        AddToNoText(NoText, NoTextIndex, PrintExponent, 'CENTS');//  + '/' + FORMAT(DecimalPosition)));


        /*IF CurrencyCode <> '' THEN
            AddToNoText(NoText, NoTextIndex, PrintExponent, CurrencyCode);*/

    end;

    local procedure AddToNoText(var NoText: array[2] of Text[80]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30])
    begin
        PrintExponent := TRUE;

        WHILE STRLEN(NoText[NoTextIndex] + ' ' + AddText) > MAXSTRLEN(NoText[1]) DO BEGIN
            NoTextIndex := NoTextIndex + 1;
            IF NoTextIndex > ARRAYLEN(NoText) THEN
                ERROR(Text029, AddText);
        END;

        NoText[NoTextIndex] := DELCHR(NoText[NoTextIndex] + ' ' + AddText, '<');
    end;

    procedure InitTextVariable()
    begin
        OnesText[1] := Text032;
        OnesText[2] := Text033;
        OnesText[3] := Text034;
        OnesText[4] := Text035;
        OnesText[5] := Text036;
        OnesText[6] := Text037;
        OnesText[7] := Text038;
        OnesText[8] := Text039;
        OnesText[9] := Text040;
        OnesText[10] := Text041;
        OnesText[11] := Text042;
        OnesText[12] := Text043;
        OnesText[13] := Text044;
        OnesText[14] := Text045;
        OnesText[15] := Text046;
        OnesText[16] := Text047;
        OnesText[17] := Text048;
        OnesText[18] := Text049;
        OnesText[19] := Text050;

        TensText[1] := '';
        TensText[2] := Text051;
        TensText[3] := Text052;
        TensText[4] := Text053;
        TensText[5] := Text054;
        TensText[6] := Text055;
        TensText[7] := Text056;
        TensText[8] := Text057;
        TensText[9] := Text058;

        ExponentText[1] := '';
        ExponentText[2] := Text059;
        ExponentText[3] := Text060;
        ExponentText[4] := Text061;
    end;

    // procedure GetTermsCondition(SalesHeader: Record "Sales Header") TermConditions: Text
    // var
    //     MyInStream: InStream;
    // begin
    //     SalesHeader.SetRange("No.", "Sales Header"."No.");
    //     SalesHeader.SetRange("Document Type", "Sales Header"."Document Type");
    //     SalesHeader.CalcFields("Terms & Conditions");
    //     If SalesHeader."Terms & Conditions".HasValue() then begin
    //         SalesHeader."Terms & Conditions".CreateInStream(MyInStream);
    //         MyInStream.Read(TermConditions);
    //     end;
    // end;

    // procedure GetDeliveryClause(SalesHeader: Record "Sales Header") DeliveryClause: Text
    // var
    //     MyInStream: InStream;
    // begin
    //     SalesHeader.SetRange("No.", "Sales Header"."No.");
    //     SalesHeader.SetRange("Document Type", "Sales Header"."Document Type");
    //     SalesHeader.CalcFields("Delivery Clause1");
    //     If SalesHeader."Delivery Clause1".HasValue() then begin
    //         SalesHeader."Delivery Clause1".CreateInStream(MyInStream);
    //         MyInStream.Read(DeliveryClause);
    //     end;
    // end;
}

