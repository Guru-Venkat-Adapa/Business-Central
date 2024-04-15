table 50102 "API NZ-AU"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Sl No.';
        }
        field(2; "Receipt No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Receipt Number';

            trigger OnValidate()
            var
                code: Codeunit "API PRoject NZ_AU";
            begin
                code.GetSingleAPI('https://api.quickstream.support.qvalent.com/rest/v1/transactions/' + Format(Rec."Receipt No."), 'C01280_SEC_4p8mkfznixvytm926cwieaec5dpixc3k88u5gacard5a6ue5yhjejzq5peg4', '', Rec);
            end;
        }
        field(3; "Pirc Amt Currency"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Principal Amt Currency';
        }
        field(4; "Pric Amt Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Principal Amt Amount';
        }
        field(5; "Pric Amt Display Amt"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Principal Amt Display Amount';
        }
        field(6; "SC Amt Currency"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'SC Amt Currency';
        }
        field(7; "SC Amt Amount"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'SC Amt Amount';
        }
        field(8; "SC Amt Display Amt"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'SC Amt Display Amt';
        }
        field(9; "TotalAmt Currency"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'TotalAmt Currency';
        }
        field(10; "TotalAmt Amount"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'TotalAmt Amount';
        }
        field(11; "TotalAmt Display Amt"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'TotalAmt Display Amt';
        }
        field(12; "Status"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';
        }
        field(13; "Response Code"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Response Code';
        }
        field(14; "Response Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Response Description';
        }
        field(15; "Transaction Type"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Transaction Type';
        }
        field(16; "Transaction Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Transaction Time';
        }
        field(17; "Settlement Date"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Settlement Date';
        }
        field(18; "Source"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Source;';
        }
        field(19; "Customer Ref No."; BigInteger)
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Ref No.';
        }
        field(20; "User"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'User';
        }
        field(21; "Refundable"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Refundable';
        }
        field(22; "Comment"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Comment';
        }
        field(23; "IP Address"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'IP Address';
        }
        field(24; "Debate Repayment"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Debate Repayment';
        }
        field(25; "Supplier Business Code"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Supplier Business Code';
        }
        field(26; "CCard Account Type"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'CCard Account Type';
        }
        field(27; "CCard Account Token"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'CCard Account Token';
        }
        field(28; "CCard Customer ID"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'CCard Customer ID';
        }
        field(29; "CCard Default Account"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'CCard Default Account';
        }
        field(30; "CCard Card Number"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'CCard Card Number';
        }
        field(31; "CCard Expiry Month"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'CCard Expiry Month';
        }
        field(32; "CCard Expiry Year"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'CCard Expiry Year';
        }
        field(33; "CCard Card Scheme"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'CCard Card Scheme';
        }
        field(34; "CCard Card Holder Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'CCard Card Holder Name';
        }
        field(35; "CCard Card Type"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'CCard Card Type';
        }
        field(36; "CCard Master Card Number"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'CCard Master Card Number';
        }
        field(37; "CCard Pan Type"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'CCard Pan Type';
        }
        field(38; "MA Marchant ID"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'MA Marchant ID';
        }
        field(39; "MA Marchant Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'MA Marchant Name';
        }
        field(40; "MA Display Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'MA Display Name';
        }
        field(41; "MA Acquiring"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'MA Acquiring';
        }
        field(42; "MA Currency"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'MA Currency';
        }
        field(43; "Pay To Data"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Pay To Data';
        }
        field(44; "Pay To Payee Account"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Pay To Payee Account';
        }
        field(45; "Pay To Payer Account"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Pay To Payer Account';
        }
    }

    keys
    {
        key(Pk; "Receipt No.")
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