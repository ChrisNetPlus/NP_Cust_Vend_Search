tableextension 50036 "NP PurchInvLineExt" extends "Purch. Inv. Line"
{
    fields
    {
        field(50036; "NP Vendor Invoice No."; Text[50])
        {
            Caption = 'Vendor Invoice No.';
            FieldClass = FlowField;
            CalcFormula = lookup("Purch. Inv. Header"."Vendor Invoice No." where("No." = field("Document No.")));
            Editable = false;
        }
    }
}
