pageextension 50063 "NP PurchPaySetupExt" extends "Purchases & Payables Setup"
{
    actions
    {
        addafter("Vendor Posting Groups")
        {
            action("NP Export OS PO Lines")
            {
                Caption = 'Export Entries';
                ToolTip = 'Run this to export to Excel purchase order lines or GL Entries';
                ApplicationArea = All;
                Image = ExportElectronicDocument;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Report;

                trigger OnAction()
                begin
                    Page.Run(Page::"NP Purchase Download Selection");
                end;
            }
        }
    }
}
