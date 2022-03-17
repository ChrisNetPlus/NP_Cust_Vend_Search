page 50018 "NP Contract Workstream Sub"
{
    Caption = 'Contract Search Workstream Sub';
    PageType = ListPart;
    SourceTable = "NP Contract Search Workstream";
    Editable = false;
    Permissions = tabledata "Sales Invoice Line" = R, tabledata "Sales Cr.Memo Line" = R;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Contract Code"; Rec."Contract Code")
                {
                    ToolTip = 'Specifies the value of the Contract Code field.';
                    ApplicationArea = All;
                }
                field("Workstream Code"; Rec."Workstream Code")
                {
                    ToolTip = 'Specifies the value of the Workstream Code field.';
                    ApplicationArea = All;
                }
                field("Open Purchase Invoices"; Rec."Open Purchase Invoices")
                {
                    ToolTip = 'Specifies the value of the Open Purchase Invoices field.';
                    ApplicationArea = All;
                }
                field("Open Purchase Orders"; Rec."Open Purchase Orders")
                {
                    ToolTip = 'Specifies the value of the Open Purchase Orders field.';
                    ApplicationArea = All;
                }
                field("Open Sales Credits"; Rec."Open Sales Credits")
                {
                    ToolTip = 'Specifies the value of the Open Sales Credits field.';
                    ApplicationArea = All;
                }
                field("Open Sales Invoices"; Rec."Open Sales Invoices")
                {
                    ToolTip = 'Specifies the value of the Open Sales Invoices field.';
                    ApplicationArea = All;
                }
                field("Posted Purchase Credits"; Rec."Posted Purchase Credits")
                {
                    ToolTip = 'Specifies the value of the Posted Purchase Credits field.';
                    ApplicationArea = All;
                }
                field("Posted Purchase Invoices"; Rec."Posted Purchase Invoices")
                {
                    ToolTip = 'Specifies the value of the Posted Purchase Invoices field.';
                    ApplicationArea = All;
                }
                field("Posted Sales Credits"; Rec."Posted Sales Credits")
                {
                    ToolTip = 'Specifies the value of the Posted Sales Credits field.';
                    ApplicationArea = All;
                }
                field("Posted Sales Invoices"; Rec."Posted Sales Invoices")
                {
                    ToolTip = 'Specifies the value of the Posted Sales Invoices field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
