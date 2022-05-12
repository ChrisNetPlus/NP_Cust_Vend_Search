tableextension 50038 "NP PurchHdrDeclineExt" extends "Purchase Header"
{
    fields
    {
        field(50038; "NP Decline Reason"; Text[100])
        {
            Caption = 'Decline Reason';
            DataClassification = CustomerContent;
        }
        field(50039; "NP Declined By"; Code[20])
        {
            Caption = 'Declined By';
            DataClassification = CustomerContent;
        }
        field(50040; "NP Declined On"; Date)
        {
            Caption = 'Declined On';
            DataClassification = CustomerContent;
        }
        field(50041; "NP Declined"; Boolean)
        {
            Caption = 'Value Declined';
            DataClassification = CustomerContent;
        }

    }
}
