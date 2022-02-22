tableextension 50024 "NP User Task Ext" extends "User Task"
{
    fields
    {
        field(50000; "NP Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                Customer.Get(Rec."NP Customer No.");
                "NP Customer Name" := Customer.Name;
            end;
        }
        field(50001; "NP Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50002; "NP Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            DataClassification = CustomerContent;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            var
                Vendor: Record Vendor;
            begin
                Vendor.Get(Rec."NP Vendor No.");
                "NP Vendor Name" := Vendor.Name;
            end;
        }
        field(50003; "NP Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
}
