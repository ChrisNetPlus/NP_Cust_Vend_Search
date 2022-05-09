pageextension 50043 "NP PurchaseOrderAppExt" extends "Purchase Order"
{
    actions
    {
        modify(SendApprovalRequest)
        {
            Visible = false;
        }
        addafter("Archive Document")
        {
            action("NP Cancel Approval")
            {
                Caption = 'Cancel Approval';
                ToolTip = 'Cancel Approval';
                ApplicationArea = All;
                Image = Undo;
                trigger OnAction()
                begin
                    Rec."NP Approval Requested By" := '';
                    Rec."NP Value Held" := false;
                    Rec."NP Approved By" := '';
                    Rec."NP Value Approved" := false;
                    Rec.Modify();
                end;
            }
        }
    }
}
