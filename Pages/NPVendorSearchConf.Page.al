page 50012 "NP Vendor Search Conf"
{
    Caption = 'Vendor Search Confirmation';
    PageType = ConfirmationDialog;
    SourceTable = Vendor;

    layout
    {
        area(content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
            }
            field(Name; Rec.Name)
            {
                ApplicationArea = All;
            }
            field(Address; Rec.Address)
            {
                ApplicationArea = All;
            }
            field("Address 2"; Rec."Address 2")
            {
                ApplicationArea = All;
            }
            field(City; Rec.City)
            {
                ApplicationArea = All;
            }
            field(County; Rec.County)
            {
                ApplicationArea = All;
            }
            field("Post Code"; Rec."Post Code")
            {
                ApplicationArea = All;
            }
            field("Phone No."; Rec."Phone No.")
            {
                ApplicationArea = All;
            }
            field("Fax No."; Rec."Fax No.")
            {
                Visible = false;
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}