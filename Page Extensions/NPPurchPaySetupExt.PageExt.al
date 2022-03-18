pageextension 50063 "NP PurchPaySetupExt" extends "Purchases & Payables Setup"
{
    actions
    {
        addafter("Vendor Posting Groups")
        {
            action("NP Export OS PO Lines")
            {
                Caption = 'Export OS PO Lines';
                ToolTip = 'Run this to export to Excel all open purchase order lines';
                ApplicationArea = All;
                Image = ExportElectronicDocument;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;

                trigger OnAction()
                var
                    VendSearchCueCU: Codeunit "NP Vendor Search Cues Mgmt";
                begin
                    VendSearchCueCU.CreateTxtFile();
                end;
            }
        }
    }
}
