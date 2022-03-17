table 50000 "NP Contract Search Workstream"
{
    Caption = 'Contract Search Workstream';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Contract Code"; Code[20])
        {
            Caption = 'Contract Code';
            DataClassification = CustomerContent;
        }
        field(2; "Workstream Code"; Code[20])
        {
            Caption = 'Workstream Code';
            DataClassification = CustomerContent;
        }
        field(3; "Posted Sales Invoices"; Decimal)
        {
            Caption = 'Posted Sales Invoices';
            FieldClass = FlowField;
            CalcFormula = sum("Sales Invoice Line".Amount where("Shortcut Dimension 1 Code" = field("Contract Code"), "Shortcut Dimension 2 Code" = field("Workstream Code")));

        }
        field(4; "Open Sales Invoices"; Decimal)
        {
            Caption = 'Open Sales Invoices';
            FieldClass = FlowField;
            CalcFormula = sum("Sales Line".Amount where("Shortcut Dimension 1 Code" = field("Contract Code"), "Document Type" = const(Invoice), "Outstanding Quantity" = filter(>= 0), "Shortcut Dimension 2 Code" = field("Workstream Code")));

        }
        field(5; "Open Sales Credits"; Decimal)
        {
            Caption = 'Open Sales Credits';
            FieldClass = FlowField;
            CalcFormula = sum("Sales Line".Amount where("Shortcut Dimension 1 Code" = field("Contract Code"), "Document Type" = const("Credit Memo"), "Outstanding Quantity" = filter(>= 0), "Shortcut Dimension 2 Code" = field("Workstream Code")));
        }
        field(6; "Posted Sales Credits"; Decimal)
        {
            Caption = 'Posted Sales Credits';
            FieldClass = FlowField;
            CalcFormula = sum("Sales Cr.Memo Line".Amount where("Shortcut Dimension 1 Code" = field("Contract Code"), "Shortcut Dimension 2 Code" = field("Workstream Code")));
        }
        field(7; "Open Purchase Orders"; Decimal)
        {
            Caption = 'Open Purchase Orders';
            FieldClass = FlowField;
            CalcFormula = Sum("Purchase Line".Amount where("Shortcut Dimension 1 Code" = field("Contract Code"), "Document Type" = const(Order), "Outstanding Quantity" = filter(>= 0), "Shortcut Dimension 2 Code" = field("Workstream Code")));
        }
        field(8; "Open Purchase Invoices"; Decimal)
        {
            Caption = 'Open Purchase Invoices';
            FieldClass = FlowField;
            CalcFormula = sum("Purchase Line".Amount where("Shortcut Dimension 1 Code" = field("Contract Code"), "Document Type" = const(Invoice), "Shortcut Dimension 2 Code" = field("Workstream Code")));
        }
        field(9; "Posted Purchase Invoices"; Decimal)
        {
            Caption = 'Posted Purchase Invoices';
            FieldClass = FlowField;
            CalcFormula = sum("Purch. Inv. Line".Amount where("Shortcut Dimension 1 Code" = field("Contract Code"), "Shortcut Dimension 2 Code" = field("Workstream Code")));
        }
        field(10; "Posted Purchase Credits"; Decimal)
        {
            Caption = 'Posted Purchase Credits';
            FieldClass = FlowField;
            CalcFormula = sum("Purch. Cr. Memo Line".Amount where("Shortcut Dimension 1 Code" = field("Contract Code"), "Shortcut Dimension 2 Code" = field("Workstream Code")));
        }
    }
    keys
    {
        key(PK; "Contract Code", "Workstream Code")
        {
            Clustered = true;
        }
    }
}
