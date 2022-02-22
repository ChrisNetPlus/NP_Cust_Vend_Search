pageextension 50042 "NP User Task Card Ext" extends "User Task Card"
{
    layout
    {
        addafter("Assigned To User Name")
        {
            field("NP Customer No."; Rec."NP Customer No.")
            {
                Caption = 'Customer No.';
                ApplicationArea = All;
                ToolTip = 'Assign a Customer to the Task';
            }
            field("NP Customer Name"; Rec."NP Customer Name")
            {
                Caption = 'Customer Name';
                ApplicationArea = All;
                ToolTip = 'Assigned Customer Name';
            }
            field("NP Vendor No."; Rec."NP Vendor No.")
            {
                Caption = 'Vendor No.';
                ApplicationArea = All;
                ToolTip = 'Assign a Vendor to the Task';
            }
            field("NP Vendor Name"; Rec."NP Vendor Name")
            {
                Caption = 'Vendor Name';
                ApplicationArea = All;
                ToolTip = 'Assigned Vendor Name';
            }
        }
    }
}
