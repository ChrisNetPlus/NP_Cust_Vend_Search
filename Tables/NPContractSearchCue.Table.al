table 50008 "NP Contract Search Cue"
{
    Caption = 'Contract Search Cue';
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Contract No."; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('CONTRACT'));
            DataClassification = SystemMetadata;
        }
        field(2; "Vendor No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Vendor No.';
            Editable = false;
        }
        field(3; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';
            Editable = false;
        }
        field(50; "Purchase Invoices"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Purch. Inv. Line".Amount where("Shortcut Dimension 1 Code" = field("Contract No.")));
        }
        field(50001; "Open Purchase Invoices"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Purchase Line".Amount where("Shortcut Dimension 1 Code" = field("Contract No."), "Document Type" = const(Invoice)));
        }
        field(50002; "Purchase Orders"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Purchase Line".Amount where("Shortcut Dimension 1 Code" = field("Contract No."), "Document Type" = const(Order), "Outstanding Quantity" = filter(>= 0)));
        }
        field(50004; "Purchase Credit Memos"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Purchase Line".Amount where("Shortcut Dimension 1 Code" = field("Contract No."), "Document Type" = const("Credit Memo"), "Outstanding Quantity" = filter(>= 0)));
        }
        field(50005; "Posted Purchase Credit Memos"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Purch. Cr. Memo Line".Amount where("Shortcut Dimension 1 Code" = field("Contract No.")));
        }
        field(51; "Sales Invoices"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Sales Invoice Line".Amount where("Shortcut Dimension 1 Code" = field("Contract No.")));
        }
        field(50021; "Open Sales Invoices"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Sales Line".Amount where("Shortcut Dimension 1 Code" = field("Contract No."), "Document Type" = const(Invoice), "Outstanding Quantity" = filter(>= 0)));
        }
        field(50025; "Sales Credit Memos"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Sales Line".Amount where("Shortcut Dimension 1 Code" = field("Contract No."), "Document Type" = const("Credit Memo"), "Outstanding Quantity" = filter(>= 0)));
        }
        field(50026; "Posted Sales Credit Memos"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Sales Cr.Memo Line".Amount where("Shortcut Dimension 1 Code" = field("Contract No.")));
        }
        field(50027; "Contract Inventory"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry"."Remaining Quantity" where("Global Dimension 1 Code" = field("Contract No."), Open = const(true)));
        }
        field(50028; "Contract Inventory Value"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Value Entry"."Cost Amount (Actual)" where("Global Dimension 1 Code" = field("Contract No.")));
        }
    }

    keys
    {
        key(Key1; "Contract No.")
        {
        }
    }

    fieldgroups
    {
    }
    var
        CurrentDate: Date;
        CustomerNo: Code[20];
        VendorNo: Code[20];
}