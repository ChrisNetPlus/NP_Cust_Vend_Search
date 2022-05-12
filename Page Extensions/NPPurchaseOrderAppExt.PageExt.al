pageextension 50043 "NP PurchaseOrderAppExt" extends "Purchase Order"
{
    layout
    {
        addafter("NP Value Approved")
        {
            field("NP Declined"; Rec."NP Declined")
            {
                Caption = 'Approval Declined';
                ToolTip = 'Approval Declined';
                ApplicationArea = All;
                Editable = false;
            }
            field("NP Decline Reason"; Rec."NP Decline Reason")
            {
                Caption = 'Decline Reason';
                ToolTip = 'Decline Reason';
                ApplicationArea = All;
            }
        }
    }
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
            action("NP Decline Value")
            {
                Image = CancelLine;
                Caption = 'Decline Value';
                ToolTip = 'This will the decline the approval request for this purchase order';
                ApplicationArea = All;
                Promoted = true;
                Visible = true;

                trigger OnAction()
                var
                    UserSetup: Record "User Setup";
                    ApprovalUser: Record "User Setup";
                    User: Record User;
                    EmailCU: Codeunit Email;
                    EmailMessage: Codeunit "Email Message";
                    EmailSubject: Label 'Purchase Order Declined - ';
                    EmailBody: Label 'The purchase order has been declined for - ';
                    DeclineError: Label 'You must enter a decline reason';
                    WrongUser: Label 'You do not have permission to decline this order';
                begin
                    UserSetup.Get(UserId);
                    if CheckUserPurchaseLimit(Rec) = true then begin
                        if Rec."NP Decline Reason" = '' then
                            Error(DeclineError);
                        Rec."NP Declined" := true;
                        Rec."NP Value Held" := false;
                        Rec."NP Declined By" := UserId;
                        Rec."NP Declined On" := Today;
                        Rec.Modify();
                        User.SetRange("User Name", Rec."NP Approval Requested By");
                        if User.FindFirst() then begin
                            EmailMessage.Create(User."Contact Email", EmailSubject + Rec."No.", EmailBody + Rec."NP Decline Reason");
                            EmailCU.Send(EmailMessage);
                        end;
                    end else
                        Error(WrongUser);
                end;
            }
        }

    }
    local procedure CheckUserPurchaseLimit(var PurchaseHeader: Record "Purchase Header"): Boolean
    var
        ApprovalUser: Record "User Setup";
        AprovalSetupError: Label 'User must have a Purchase Amount Approval Limit setup in Approval User Setup';
        AboveLimtError: Label 'The value of this order exceeds the allowed amount of %1';
    begin
        if ApprovalUser.Get(PurchaseHeader."NP Approval Requested By") then begin
            if (ApprovalUser."Approver ID" = UserId) or (ApprovalUser.Substitute = UserId) then
                exit(true)
            else
                exit(false);
        end;
    end;

}

