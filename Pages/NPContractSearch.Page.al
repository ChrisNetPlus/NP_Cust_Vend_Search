page 50015 "NP Contract Search"
{
    Caption = 'Contract Dashboard';
    DataCaptionExpression = DataCaption;
    PageType = Card;
    SourceTable = "NP Contract Search";
    UsageCategory = Tasks;
    ApplicationArea = All;
    Permissions = tabledata "NP Contract Search Cue" = RIMD, tabledata "NP Contract Search Workstream" = RIMD, tabledata "Sales Invoice Line" = R, tabledata "Sales Cr.Memo Line" = R;
    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'Contract Search';
                Visible = true;
                field("Contract Code"; Rec."Contract Code")
                {
                    Caption = 'Contract';
                    ApplicationArea = All;
                    ToolTip = 'Contract No.';
                    trigger OnValidate()
                    begin
                        UpdateWorkstreamList;
                    end;
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Contract Name';
                    ApplicationArea = All;
                    ToolTip = 'Contract Name';
                    Editable = false;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    AssistEdit = true;
                    Caption = 'Customer No.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    Caption = 'Customer Name';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            part(NPContractWorkstreamSub; "NP Contract Workstream Sub")
            {
                Caption = 'Workstream Breakdown';
                SubPageLink = "Contract Code" = field("Contract Code");
                Visible = true;
                ApplicationArea = All;
            }
            part(ContractSearchCues; "NP Contract Search Cues")
            {
                Caption = 'Contract Info';
                SubPageLink = "Contract No." = field("Contract Code");
                Visible = true;
                ApplicationArea = All;
            }
        }
    }
    local procedure UpdateWorkstreamList()
    var
        PostedPurchaseInvLine: Record "Purch. Inv. Line";
        PostedSalesInvLine: Record "Sales Invoice Line";
        PurchaseLine: Record "Purchase Line";
        WorkstreamInfo: Record "NP Contract Search Workstream";
    begin
        PurchaseLine.SetRange("Shortcut Dimension 1 Code", Rec."Contract Code");
        if PurchaseLine.FindSet() then
            repeat
                WorkstreamInfo."Contract Code" := Rec."Contract Code";
                WorkstreamInfo."Workstream Code" := PurchaseLine."Shortcut Dimension 2 Code";
                if not WorkstreamInfo.Insert() then
                    WorkstreamInfo.Modify();
            until PurchaseLine.Next() = 0;
        PostedPurchaseInvLine.SetRange("Shortcut Dimension 1 Code", Rec."Contract Code");
        if PostedPurchaseInvLine.FindSet() then
            repeat
                WorkstreamInfo."Contract Code" := Rec."Contract Code";
                WorkstreamInfo."Workstream Code" := PostedPurchaseInvLine."Shortcut Dimension 2 Code";
                if not WorkstreamInfo.Insert() then
                    WorkstreamInfo.Modify();
            until PostedPurchaseInvLine.Next() = 0;
        PostedSalesInvLine.SetRange("Shortcut Dimension 1 Code", Rec."Contract Code");
        if PostedSalesInvLine.FindSet() then
            repeat
                WorkstreamInfo."Contract Code" := Rec."Contract Code";
                WorkstreamInfo."Workstream Code" := PostedSalesInvLine."Shortcut Dimension 2 Code";
                if not WorkstreamInfo.Insert() then
                    WorkstreamInfo.Modify();
            until PostedSalesInvLine.Next() = 0;
    end;

    trigger OnClosePage()
    var
        ContractSearch: Record "NP Contract Search";
        WorkstreamSearch: Record "NP Contract Search Workstream";
    begin
        ContractSearch.DeleteAll();
        WorkstreamSearch.DeleteAll();
    end;

    var
        [InDataSet]
        DataCaption: Text;
}