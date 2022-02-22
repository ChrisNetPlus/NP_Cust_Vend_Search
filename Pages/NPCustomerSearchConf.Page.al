page 50006 "NP Customer Search Conf"
{
    Caption = 'Customer Search Confirmation';
    PageType = ConfirmationDialog;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                Caption = 'Customer No.';
            }
            field(Name; Rec.Name)
            {
                ApplicationArea = All;
                Caption = 'Customer Name';
            }
            field(Address; Rec.Address)
            {
                ApplicationArea = All;
                Caption = 'Address';
            }
            field("Address 2"; Rec."Address 2")
            {
                ApplicationArea = All;
                Caption = 'Address 2';
            }
            field(City; Rec.City)
            {
                ApplicationArea = All;
                Caption = 'City';
            }
            field(County; Rec.County)
            {
                ApplicationArea = All;
                Caption = 'County';
            }
            field("Post Code"; Rec."Post Code")
            {
                ApplicationArea = All;
                Caption = 'Post Code';
            }
            field("Phone No."; Rec."Phone No.")
            {
                ApplicationArea = All;
                Caption = 'Telephone';
            }
            field("Fax No."; Rec."Fax No.")
            {
                Visible = false;
                ApplicationArea = All;
                Caption = 'Fax No.';
            }
        }
    }

}