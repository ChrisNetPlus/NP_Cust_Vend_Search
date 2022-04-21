report 50014 "NP Payment Practices New"
{
    ApplicationArea = All;
    Caption = 'Payment Practices New';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './PaymentPracticeNew.rdl';
    PreviewMode = PrintLayout;
    DataAccessIntent = ReadOnly;

    dataset
    {
        dataitem(VendorLedgerEntry; "Vendor Ledger Entry")
        {
            RequestFilterFields = "Posting Date";
            DataItemTableView = where("Document Type" = filter(= Invoice));
            column(VendorNo; "Vendor No.")
            {
            }
            column(VendorName; "Vendor Name")
            {
            }
            column(InvoiceReceiptDate; "Document Date")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(DueDate; "Due Date")
            {
            }
            column(ClosedatDate; "Closed at Date")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(PaymentTerms; PaymentTerms.Description)
            {
            }
            column(DaysToPay; DaysToPay)
            {
            }
            column(DaysLate; DaysLate)
            {
            }
            column(LineCount; LineCount)
            {
            }
            column(Less30; Less30)
            {
            }
            column(Greater30; Greater30)
            {
            }
            column(Greater60; Greater60)
            {
            }
            column(Greater90; Greater90)
            {
            }
            trigger OnAfterGetRecord()
            begin
                Vendor.Get("Vendor No.");
                PaymentTerms.SetRange(Code, Vendor."Payment Terms Code");
                if PaymentTerms.FindFirst() then;
                CalculateInfo(VendorLedgerEntry);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    local procedure CalculateInfo(VendLedEntry: Record "Vendor Ledger Entry")
    begin
        Clear(DaysToPay);
        Clear(DaysToPay);
        Clear(Less30);
        Clear(Greater30);
        Clear(Greater60);
        Clear(Greater90);
        if VendLedEntry."Closed at Date" <> 0D then begin
            DaysToPay := VendLedEntry."Closed at Date" - VendLedEntry."Document Date";
            DaysLate := VendLedEntry."Due Date" - VendLedEntry."Closed at Date";
            DocumentCount := DocumentCount + 1;
            LineCount := 1;
            if DaysLate < 0 then
                DaysLate := Abs(DaysLate)
            else
                DaysLate := -DaysLate;
            if DaysLate <= 30 then
                Less30 := 1
            else
                Less30 := 0;
            if DaysLate > 30 then
                Greater30 := 1
            else
                Greater30 := 0;
            if DaysLate > 60 then
                Greater60 := 1
            else
                Greater60 := 0;
            if DaysLate > 90 then
                Greater90 := 1
            else
                Greater90 := 0;
        end else begin
            DaysToPay := 0;
            DaysLate := Abs(Today - VendLedEntry."Due Date");
            LineCount := 0;
        end;
        AveDaysToPay += DaysToPay;
    end;

    trigger OnPostReport()
    begin
        AveDaysToPay := AveDaysToPay / DocumentCount;
    end;

    var
        PaymentTerms: Record "Payment Terms";
        Vendor: Record Vendor;
        DaysLate: Decimal;
        DaysToPay: Decimal;
        AveDaysToPay: Decimal;
        DocumentCount: Integer;
        LineCount: Integer;
        Greater30: Integer;
        Greater60: Integer;
        Greater90: Integer;
        Less30: Integer;

}
