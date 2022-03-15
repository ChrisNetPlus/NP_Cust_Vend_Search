page 50015 "NP Contract Search"
{
    Caption = 'Contract Search';
    DataCaptionExpression = DataCaption;
    PageType = Card;
    SourceTable = "NP Contract Search";
    UsageCategory = Tasks;
    ApplicationArea = All;
    Permissions = tabledata "NP Contract Search Cue" = RIMD;
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
            part(ContractSearchCues; "NP Contract Search Cues")
            {
                Caption = 'Contract Info';
                SubPageLink = "Contract No." = field("Contract Code");
                Visible = true;
                ApplicationArea = All;
            }
        }
    }
    trigger OnClosePage()
    var
        ContractSearch: Record "NP Contract Search";
    begin
        ContractSearch.DeleteAll();
    end;

    var
        [InDataSet]
        CustomerNotFound: Boolean;
        [InDataSet]
        CustomerFound: Boolean;
        DataCaption: Text;
        Var_No_: Code[20];
        Var_Name: Text[50];
        Var_Address: Text[50];
        Var_Address_2: Text[50];
        ShowDocTabs: Boolean;
        [InDataSet]
        HasOpenLedgerEntries: Boolean;
        [InDataSet]
        HasSalesQuotes: Boolean;
        [InDataSet]
        HasSalesOrders: Boolean;
        [InDataSet]
        HasSalesShipments: Boolean;
        [InDataSet]
        HasSalesInvoices: Boolean;
        [InDataSet]
        HasPostedInvoices: Boolean;
        Err001: Label 'In order to create a new Customer you must select a Customer Template from the list';
        Text_DataCaption_NotWindows: Label 'Please enter the search details and press "Find Customer"';
        Text_NoMatchingCustomer: Label 'No matching Customer found';
        Text_NoMatchingShipment: Label 'Sorry, no Shipment was found matching "%1". Please search using different information';
        Text_NoMatchingOrder: Label 'Sorry, no Order was found matching "%1". Please search using different information';
        Text_NoMatchingMasterOrder: Label 'Sorry, no Master Order was found matching "%1". Please search using different information';

    [BusinessEvent(true)]
    procedure OnCustomerFound(pCustomerFound: Boolean)
    begin

    end;


}