page 50019 "NP Purchase Download Selection"
{
    Caption = 'Purchase Download Selection';
    PageType = ReportProcessingOnly;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(DateFrom; DateFrom)
                {
                    ApplicationArea = All;
                    Caption = 'Date From';
                    ToolTip = 'Date From';
                    ShowMandatory = true;
                }
                field(DateTo; DateTo)
                {
                    ApplicationArea = All;
                    Caption = 'Date To';
                    ToolTip = 'Date To';
                    ShowMandatory = true;
                }
                field(PurchaseLines; PurchaseLines)
                {
                    ApplicationArea = All;
                    Caption = 'Download PO Lines';
                    ToolTip = 'Tick this box to download purchase lines';
                    trigger OnValidate()
                    begin
                        GLEntries := false;
                        VendorInfo := false;
                    end;

                }
                field(GLEntries; GLEntries)
                {
                    ApplicationArea = All;
                    Caption = 'Download GL Entries';
                    ToolTip = 'Tick this box to download general ledger entries';
                    trigger OnValidate()
                    begin
                        PurchaseLines := false;
                        VendorInfo := false;
                    end;
                }
                field(VendorInfo; VendorInfo)
                {
                    ApplicationArea = All;
                    Caption = 'Download Lloyds Vendor Info';
                    ToolTip = 'Tick this box to download Lloyds Vendor Info';
                    trigger OnValidate()
                    begin
                        PurchaseLines := false;
                        GLEntries := false;
                    end;
                }

            }
        }
    }
    var
        DateFrom: Date;
        DateTo: Date;
        LabDateError: Label 'You must enter a date range';
        LabChoiceError: Label 'You have not chosen a report to run';
        GLEntries: Boolean;
        PurchaseLines: Boolean;
        VendorInfo: Boolean;

    trigger OnClosePage()
    var
        VendSearchCueCU: Codeunit "NP Vendor Search Cues Mgmt";
    begin
        if DateFrom = 0D then Error(LabDateError);
        if DateTo = 0D then Error(LabDateError);
        if PurchaseLines = true then
            VendSearchCueCU.CreateTxtFile(DateFrom, DateTo);
        if GLEntries = true then
            VendSearchCueCU.GLEntryDownload(DateFrom, DateTo);
        if VendorInfo = true then
            VendSearchCueCU.LloydsVendorDownload(DateFrom, DateTo);
        if (GLEntries = false) and (PurchaseLines = false) and (VendorInfo = false) then
            Error(LabChoiceError);
    end;
}
