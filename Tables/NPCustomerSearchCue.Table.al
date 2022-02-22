table 50005 "NP Customer Search Cue"
{
    Caption = 'Customer Search Cue';
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            TableRelation = Customer;
            DataClassification = SystemMetadata;

            trigger OnValidate()
            var
                ContactBusinessRelation: Record "Contact Business Relation";
            begin
                ContactBusinessRelation.Reset();
                ContactBusinessRelation.SetCurrentKey("Link to Table", "No.");
                ContactBusinessRelation.SetRange("Link to Table", ContactBusinessRelation."Link to Table"::Customer);
                ContactBusinessRelation.SetRange("No.", Rec."Customer No.");
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
            CalcFormula = count("Sales Invoice Header" where("Sell-to Customer No." = field("Customer No.")));
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
        field(50001; "Open Sales Invoices"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Line" where("Sell-to Customer No." = field("Customer No."), "Document Type" = const(Invoice), "Outstanding Quantity" = filter(>= 0)));
        }
        field(50002; "Outstanding Payments"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Cust. Ledger Entry" where("Customer No." = field("Customer No."), "Document Type" = const(Invoice), Open = const(true)));
        }
        field(50003; "Unallocated Payments"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Cust. Ledger Entry" where("Customer No." = field("Customer No."), "Document Type" = const(Payment), Open = const(true)));
        }
        field(50004; "Linked User Tasks"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("User Task" where("NP Customer No." = field("Customer No.")));
        }
        field(50005; "Credit Memos"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Line" where("Sell-to Customer No." = field("Customer No."), "Document Type" = const("Credit Memo"), "Outstanding Quantity" = filter(>= 0)));
        }
        field(50006; "Posted Credit Memos"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Sales Cr.Memo Header" where("Sell-to Customer No." = field("Customer No.")));
        }
    }

    keys
    {
        key(Key1; "Customer No.")
        {
        }
    }

    fieldgroups
    {
    }
    var
        CurrentDate: Date;

}