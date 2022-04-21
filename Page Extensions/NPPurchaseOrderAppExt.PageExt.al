pageextension 50043 "NP PurchaseOrderAppExt" extends "Purchase Order"
{
    actions
    {
        modify(SendApprovalRequest)
        {
            Visible = false;
        }
    }
}
