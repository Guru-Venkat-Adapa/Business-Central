controlAddIn SalesOrderStatusBar
{
    Scripts = 'Html\Scripts.js';
    StartupScript = 'Html\StartupScript.js';
    StyleSheets = 'Html\Style.css';
    HorizontalStretch = true;
    MinimumHeight = 10;
    MaximumHeight = 50;
    MinimumWidth = 500;
    MaximumWidth = 1500;

    event IAmReady();

    procedure SetProgress(Progress: Integer);
}