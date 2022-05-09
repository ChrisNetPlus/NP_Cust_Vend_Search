pageextension 50065 "NP Purch. Line List Ext" extends "NP Purchase Line List"
{
    layout
    {
        addafter("Direct Unit Cost")
        {
            field("NP Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Contract Code';
                Caption = 'Contract Code';
            }
            field("NP Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Workstream Code';
                Caption = 'Workstream Code';
            }
        }
    }
}
