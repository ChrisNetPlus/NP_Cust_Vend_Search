pageextension 50068 "NP PostPurchRecExt" extends "Posted Purchase Receipts"
{
    layout
    {
        addafter("Location Code")
        {
            field("NP SystemCreatedBy"; CreatedBy)
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
            }
            field("NP SystemCreatedAt"; Rec.SystemCreatedAt)
            {
                Caption = 'Created On';
                ToolTip = 'Created On';
                ApplicationArea = All;
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        User: Record User;
    begin
        Clear(CreatedBy);
        User.Get(Rec.SystemCreatedBy);
        CreatedBy := User."Full Name";
    end;

    var
        CreatedBy: Code[20];
}
