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
            column(InvoiceReceiptDate; "Invoice Receipt Date")
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
        if VendLedEntry."Closed at Date" <> 0D then begin
            DaysToPay := VendLedEntry."Closed at Date" - VendLedEntry."Posting Date";
            DaysLate := VendLedEntry."Due Date" - VendLedEntry."Closed at Date";
            if DaysLate < 0 then
                DaysLate := Abs(DaysLate)
            else
                DaysLate := -DaysLate;
        end else begin
            DaysToPay := 0;
            DaysLate := Abs(Today - VendLedEntry."Due Date");
        end;
        AveDaysToPay += DaysToPay;
        DocumentCount := DocumentCount + 1;
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

}
