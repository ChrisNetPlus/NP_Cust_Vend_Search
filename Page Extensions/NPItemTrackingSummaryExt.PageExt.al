pageextension 50066 "NP Item Tracking Summary Ext" extends "Item Tracking Summary"
{
    actions
    {
        addlast(Processing)
        {
            action("NP Unselect All")
            {
                Caption = 'Unselect All';
                ToolTip = 'Run this to unselect all lines';
                ApplicationArea = All;
                Image = UnApply;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    EntrySummary: Record "Entry Summary";
                begin
                    if Rec.FindSet() then
                        repeat
                            Rec."Selected Quantity" := 0;
                            Rec.Modify();
                        Until Rec.Next() = 0;
                end;
            }
            action("NP Select All")
            {
                Caption = 'Select All';
                ToolTip = 'Run this to Select all required lines';
                ApplicationArea = All;
                Image = Apply;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    EntrySummary: Record "Entry Summary";
                begin
                    Rec.SetRange("Lot No.", Rec."Lot No.");
                    if Rec.FindSet() then
                        repeat
                            Rec."Selected Quantity" := 1;
                            Rec.Modify();
                        Until Rec.Next() = 0;
                end;
            }

        }
    }
}
