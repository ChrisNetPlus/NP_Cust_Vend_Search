pageextension 50067 "NP PurchInvLinePageExt" extends "Posted Purchase Invoice Lines"
{
    layout
    {
        addafter(Description)
        {
            field("NP Vendor Invoice No."; Rec."NP Vendor Invoice No.")
            {
                Caption = 'Vendor Invoice No.';
                ToolTip = 'Vendor Invoice No.';
            }
        }
    }
}
