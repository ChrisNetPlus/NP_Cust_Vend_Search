page 50007 "NP Customer Search Cues"
{
    Caption = 'Customer';
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "NP Customer Search Cue";

    layout
    {
        area(content)
        {
            cuegroup("Customer Info")
            {
                ShowCaption = false;
                field(Invoices; Rec.Invoices)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Posted Sales Invoices";
                    Caption = 'Posted Invoices';
                }
                field("Open Sales Invoices"; Rec."Open Sales Invoices")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Lines";
                    Caption = 'Open Invoices';
                }
                field("Outstanding Payments"; Rec."Outstanding Payments")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Customer Ledger Entries";
                    Caption = 'Outstanding Payments';
                }
                field("Unallocated Payments"; Rec."Unallocated Payments")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Customer Ledger Entries";
                    Caption = 'Unallocated Payments';
                }
                field("Linked User Tasks"; Rec."Linked User Tasks")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "User Task List";
                    Caption = 'Linked User Tasks';
                }
                field("Credit Memos"; Rec."Credit Memos")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Sales Credit Memos";
                    Caption = 'Open Credits';
                }
                field("Posted Credit Memos"; Rec."Posted Credit Memos")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Posted Sales Credit Memos";
                    Caption = 'Posted Credits';
                }

            }
        }
    }
}