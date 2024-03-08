enum 50100 SalesProcess
{
    Caption = 'Sales Process Enum';
    Extensible = true;

    value(1; Created)
    {
        Caption = 'Sales Quote Created';
    }
    value(2; InProcess)
    {
        Caption = 'In Process';
    }
    value(3; SalesOrder)
    {
        Caption = 'Sales Order Created';
    }
    value(4; Release)
    {
        Caption = 'Released';
    }
    value(5; posted)
    {
        Caption = 'Sales Order Posted';
    }
}