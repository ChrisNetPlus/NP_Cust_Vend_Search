page 50008 "NP Interactions ListPart"
{
    PageType = ListPart;
    SourceTable = "Interaction Log Entry";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Canceled; Rec.Canceled)
                {
                    ApplicationArea = All;
                }
                field("Attempt Failed"; Rec."Attempt Failed")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Initiated By"; Rec."Initiated By")
                {
                    ApplicationArea = All;
                }
                field(Evaluation; Rec.Evaluation)
                {
                    ApplicationArea = All;
                }
                field("Cost (LCY)"; Rec."Cost (LCY)")
                {
                    ApplicationArea = All;
                }
                field("Contact Via"; Rec."Contact Via")
                {
                    ApplicationArea = All;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CreateInteraction)
            {
                Caption = 'Create Interaction';
                ApplicationArea = All;
                Image = CreateInteraction;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    prevFilterGroup: Integer;
                    ContactFilter: Text;
                    ContactCompanyFilter: Text;

                begin
                    prevFilterGroup := Rec.FilterGroup;
                    Rec.FilterGroup(4);
                    ContactFilter := Rec.GetFilter("Contact No.");
                    ContactCompanyFilter := Rec.GetFilter("Contact Company No.");
                    Rec.FilterGroup(prevFilterGroup);

                    rec.SetFilter("Contact No.", ContactFilter);
                    rec.SetFilter("Contact Company No.", ContactCompanyFilter);
                    Rec.CreateInteraction();
                end;
            }
            action(Comments)
            {
                ApplicationArea = All;
                Image = ViewComments;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Inter. Log Entry Comment Sheet";
                RunPageLink = "Entry No." = field("Entry No.");
            }
        }
    }

    procedure ClearCustomer();
    begin
        Rec.FilterGroup(2);
        Rec.SetFilter("Contact No.", '-1&1');
        Rec.FilterGroup(0);
    end;

    procedure SetCustomer(pCustomer: Record Customer);
    var
        ContactBusinessRelation: Record "Contact Business Relation";
    begin
        Rec.FilterGroup(2);
        ContactBusinessRelation.Reset();
        ContactBusinessRelation.SetCurrentKey("Link to Table", "No.");
        ContactBusinessRelation.SetRange("Link to Table", ContactBusinessRelation."Link to Table"::Customer);
        ContactBusinessRelation.SetRange("No.", pCustomer."No.");
        if (ContactBusinessRelation.FindFirst()) then
            Rec.SetRange("Contact No.", ContactBusinessRelation."Contact No.")
        else
            Rec.SetFilter("Contact No.", '-1&1');
        Rec.FilterGroup(0);
        CurrPage.Update(false);
    end;
}