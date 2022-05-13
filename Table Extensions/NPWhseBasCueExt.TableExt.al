tableextension 50041 "NP Whse Bas. Cue Ext" extends "Warehouse Basic Cue"
{
    fields
    {
        field(50010; "NP Declined Purchase Orders"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header" where("NP Declined" = const(true)));
            Caption = 'Declined Purchase Orders';
            Editable = false;
        }
    }
}
