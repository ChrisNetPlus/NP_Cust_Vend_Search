table 50009 "NP Contract Search"
{
    Caption = 'Contract Search';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Contract Code"; Code[20])
        {
            Caption = 'Contract Code';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('CONTRACT'));
            trigger OnValidate()
            var
                DimValue: Record "Dimension Value";
                PostedSalesInvoiceLine: Record "Sales Invoice Line";
                OpenSalesLines: Record "Sales Line";
                Customer: Record Customer;
                ContractSearchCue: Record "NP Contract Search Cue";
            begin
                DimValue.SetRange("Dimension Code", 'CONTRACT');
                DimValue.SetRange(Code, "Contract Code");
                if DimValue.FindFirst() then begin
                    Description := DimValue.Name;
                    PostedSalesInvoiceLine.SetRange("Shortcut Dimension 1 Code", Rec."Contract Code");
                    PostedSalesInvoiceLine.SetFilter(Type, '<>%1', PostedSalesInvoiceLine.Type::" ");
                    if PostedSalesInvoiceLine.FindFirst() then begin
                        Customer.SetRange("No.", PostedSalesInvoiceLine."Sell-to Customer No.");
                        if Customer.FindFirst() then begin
                            "Customer No." := PostedSalesInvoiceLine."Sell-to Customer No.";
                            "Customer Name" := Customer.Name;
                        end;
                    end else begin
                        OpenSalesLines.SetRange("Shortcut Dimension 1 Code", Rec."Contract Code");
                        if OpenSalesLines.FindFirst() then begin
                            Customer.SetRange("No.", OpenSalesLines."Sell-to Customer No.");
                            if Customer.FindFirst() then begin
                                "Customer No." := OpenSalesLines."Sell-to Customer No.";
                                "Customer Name" := Customer.Name;
                            end;
                        end;
                    end;
                end;
                ContractSearchCue.Init();
                ContractSearchCue."Contract No." := Rec."Contract Code";
                if not ContractSearchCue.Insert() then
                    ContractSearchCue.Modify();
            end;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
        }
        field(4; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Contract Code")
        {
            Clustered = true;
        }
    }
}
