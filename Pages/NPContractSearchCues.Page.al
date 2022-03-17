page 50016 "NP Contract Search Cues"
{
    Caption = 'Contract';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "NP Contract Search Cue";
    Permissions = tabledata "Sales Invoice Line" = R, tabledata "Sales Cr.Memo Line" = R;
    layout
    {
        area(content)
        {
            field("Contract No."; Rec."Contract No.")
            {
                ApplicationArea = All;
                Caption = 'Contract';
                Editable = false;
            }
            cuegroup("Contract Info")
            {
                ShowCaption = false;
                field(Invoices; Rec."Sales Invoices")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Posted Sales Invoice Lines";
                    Caption = 'Posted Sales Invoices';
                    ToolTip = 'Posted Sales Invoices';
                }
                field("Open Sales Invoices"; Rec."Open Sales Invoices")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Lines";
                    Caption = 'Open Sales Invoices';
                    ToolTip = 'Open Sales Invoices';
                }
                field("Credit Memos"; Rec."Sales Credit Memos")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Lines";
                    Caption = 'Open Sales Credits';
                    ToolTip = 'Open Sales Credits';
                }
                field("Posted Credit Memos"; Rec."Posted Sales Credit Memos")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Posted Sales Credit Memo Lines";
                    Caption = 'Posted Sales Credits';
                    ToolTip = 'Posted Sales Credits';
                }
                field("Purchase Orders"; Rec."Purchase Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Purchase Lines";
                    Caption = 'Open Purchase Orders';
                    ToolTip = 'Open Purchase Orders';
                }
                field("Open Purchase Invoices"; Rec."Open Purchase Invoices")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Purchase Lines";
                    Caption = 'Open Purchase Invoices';
                    ToolTip = 'Open Purchase Invoices';
                }
                field("Purchase Invoices"; Rec."Purchase Invoices")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Posted Purchase Invoice Lines";
                    Caption = 'Posted Purchase Invoices';
                    ToolTip = 'Posted Purchase Invoices';
                }
                field("Posted Purchase Credit Memos"; Rec."Posted Purchase Credit Memos")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Posted Purchase Cr. Memo Lines";
                    Caption = 'Posted Purchase Credits';
                    ToolTip = 'Posted Purchase Credits';
                }
            }
        }
    }
}