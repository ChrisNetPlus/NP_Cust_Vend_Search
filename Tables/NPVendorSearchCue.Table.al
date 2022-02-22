table 50006 "NP Vendor Search Cue"
{
    Caption = 'Vendor Search Cue';
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;
            DataClassification = SystemMetadata;

            trigger OnValidate()
            var
                ContactBusinessRelation: Record "Contact Business Relation";
            begin
                ContactBusinessRelation.Reset();
                ContactBusinessRelation.SetCurrentKey("Link to Table", "No.");
                ContactBusinessRelation.SetRange("Link to Table", ContactBusinessRelation."Link to Table"::Vendor);
                ContactBusinessRelation.SetRange("No.", Rec."Vendor No.");
                if (ContactBusinessRelation.FindFirst()) then
                    Rec.Validate("Company Contact No.", ContactBusinessRelation."Contact No.")
                else
                    Rec.Validate("Company Contact No.", '');
            end;
        }
        field(2; "Company Contact No."; Code[20])
        {
            TableRelation = Contact;
            DataClassification = SystemMetadata;
        }
        field(50; Invoices; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Purch. Inv. Header" where("Buy-from Vendor No." = field("Vendor No.")));
        }
        field(60; "Open To Do's"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("To-do" where("System To-do Type" = const("Contact Attendee"), "Contact Company No." = field("Company Contact No."), Closed = const(false)));
        }
        field(70; "Closed To Do's"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("To-do" where("System To-do Type" = const("Contact Attendee"), "Contact Company No." = field("Company Contact No."), Closed = const(true)));
        }
        field(50001; "Open Purchase Invoices"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header" where("Buy-from Vendor No." = field("Vendor No."), "Document Type" = const(Invoice)));
        }
        field(50002; "Purchase Orders"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Purchase Line" where("Buy-from Vendor No." = field("Vendor No."), "Document Type" = const(Order), "Outstanding Quantity" = filter(>= 0)));
        }
        field(50003; "Archive Purchase Orders"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header Archive" where("Buy-from Vendor No." = field("Vendor No."), "Document Type" = const(Order)));
        }
        field(50004; "Credit Memos"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Purchase Line" where("Buy-from Vendor No." = field("Vendor No."), "Document Type" = const("Credit Memo"), "Outstanding Quantity" = filter(>= 0)));
        }
        field(50005; "Posted Credit Memos"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Purch. Cr. Memo Hdr." where("Buy-from Vendor No." = field("Vendor No.")));
        }
        field(50006; "Outstanding Payments"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Vendor Ledger Entry" where("Vendor No." = field("Vendor No."), "Document Type" = const(Invoice), Open = const(true)));
        }
        field(50007; "Unallocated Payments"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Vendor Ledger Entry" where("Vendor No." = field("Vendor No."), "Document Type" = const(Payment), Open = const(true)));
        }
        field(50008; "Linked User Tasks"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("User Task" where("NP Vendor No." = field("Vendor No.")));
        }

    }

    keys
    {
        key(Key1; "Vendor No.")
        {
        }
    }

    fieldgroups
    {
    }
    var
        CurrentDate: Date;
}