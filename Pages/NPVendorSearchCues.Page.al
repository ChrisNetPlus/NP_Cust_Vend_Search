page 50013 "NP Vendor Search Cues"
{
    Caption = 'Vendor';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "NP Vendor Search Cue";

    layout
    {
        area(content)
        {
            cuegroup("Vendor Info")
            {
                ShowCaption = false;
                field("Purchase Orders"; Rec."Purchase Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Purchase Orders";
                    Caption = 'Orders';
                }
                field("Archive Purchase Orders"; Rec."Archive Purchase Orders")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Purchase Order Archives";
                    Caption = 'Archived Orders';
                }
                field(Invoices; Rec.Invoices)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Posted Purchase Invoices";
                    Caption = 'Posted Invoices';
                }
                field("Open To Do's"; Rec."Open To Do's")
                {
                    ApplicationArea = All;
                    Visible = false;
                    DrillDownPageId = "Task List";
                }
                field("Closed To Do's"; Rec."Closed To Do's")
                {
                    ApplicationArea = All;
                    Visible = false;
                    DrillDownPageId = "Task List";
                }
                field("Open Purchase Invoices"; Rec."Open Purchase Invoices")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Purchase Invoices";
                    Caption = 'Open Invoices';
                }
                field("Credit Memos"; Rec."Credit Memos")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Purchase Credit Memos";
                    Caption = 'Open Credits';
                }
                field("Posted Credit Memos"; Rec."Posted Credit Memos")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Posted Purchase Credit Memos";
                    Caption = 'Posted Credits';
                }
                field("Outstanding Payments"; Rec."Outstanding Payments")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Vendor Ledger Entries";
                    Caption = 'Outstanding Payments';
                }
                field("Unallocated Payments"; Rec."Unallocated Payments")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Vendor Ledger Entries";
                    Caption = 'Unallocated Payments';
                }
                field("Linked User Tasks"; Rec."Linked User Tasks")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "User Task List";
                    Caption = 'Linked User Tasks';
                }

            }
        }
    }
}