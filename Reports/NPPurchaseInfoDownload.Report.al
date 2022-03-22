report 50013 "NP Purchase Info Download"
{
    ApplicationArea = All;
    Caption = 'Purchase Info Download';
    UsageCategory = Tasks;
    ProcessingOnly = true;
    dataset
    {
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(DateFrom; DateFrom)
                    {
                        Caption = 'Date From';
                        ToolTip = 'Select a date from';
                    }
                    field(DateTo; DateTo)
                    {
                        Caption = 'Date To';
                        ToolTip = 'Select a date to';
                    }
                }
            }
        }
    }
    trigger OnPostReport()
    var
        VSCueMgmtCU: Codeunit "NP Vendor Search Cues Mgmt";
    begin
        VSCueMgmtCU.CreatePOInfoFile(DateFrom, DateTo);
    end;

    var
        DateFrom: Date;
        DateTo: Date;
}
