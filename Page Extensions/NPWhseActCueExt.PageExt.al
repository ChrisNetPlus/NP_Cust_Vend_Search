pageextension 50069 "NP Whse Act. Cue Ext" extends "WMS Ship & Receive Activities"
{
    layout
    {
        addafter("NP Value Held Orders")
        {
            field("NP Declined Purchase Orders"; Rec."NP Declined Purchase Orders")
            {
                Caption = 'Declined Purchase Orders';
                ToolTip = 'Click here to find any Declined Purchase Orders';
                DrillDownPageID = "Purchase Order List";
                ApplicationArea = Basic, Suite;
            }
        }
    }
}
