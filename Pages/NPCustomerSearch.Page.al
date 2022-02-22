page 50005 "NP Customer Search"
{
    Caption = 'Customer Search';
    DataCaptionExpression = DataCaption;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Sales';
    SourceTable = Customer;
    UsageCategory = Tasks;
    ApplicationArea = All;
    Permissions = tabledata "NP Customer Search Cue" = RIMD;
    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'Customer Search';
                Visible = CustomerNotFound;
                field("Var_No_"; Var_No_)
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                    ToolTip = 'Customer No.';
                }
                field("Var_Name"; Var_Name)
                {
                    Caption = 'Name';
                    ApplicationArea = All;
                }
                group(Control1000000066)
                {
                    Caption = 'Address';
                    field(VarPostCode; Var_Post_Code)
                    {
                        Caption = 'Post Code';
                        ApplicationArea = All;
                    }
                    field("Var_Address"; Var_Address)
                    {
                        AssistEdit = true;
                        Caption = 'Address';
                        ApplicationArea = All;
                    }
                    field("Var_Address_2"; Var_Address_2)
                    {
                        Caption = 'Address 2';
                        ApplicationArea = All;
                    }
                    field("Var_City"; Var_City)
                    {
                        Caption = 'City';
                        ApplicationArea = All;
                    }
                    field("Var_County"; Var_County)
                    {
                        Caption = 'County';
                        ApplicationArea = All;
                    }
                    field("Var_Country_Code"; Var_Country_Code)
                    {
                        Caption = 'Country Code';
                        ApplicationArea = All;
                    }
                }
                group(Communication)
                {
                    Caption = 'Communication';
                    field("Var_Phone_No_"; Var_Phone_No_)
                    {
                        Caption = 'Phone No.';
                        ApplicationArea = All;
                    }
                    field("Var_E-Mail"; "Var_E-Mail")
                    {
                        Caption = 'E-Mail';
                        ApplicationArea = All;
                    }
                }
                group("Existing Records")
                {
                    Caption = 'Existing Records';
                    field("Var_Order_No_"; Var_Order_No_)
                    {
                        Caption = 'Sales Order';
                        ApplicationArea = All;
                    }
                    field("Var_Shipment_No_"; Var_Shipment_No_)
                    {
                        Caption = 'Shipment No.';
                        ApplicationArea = All;
                    }
                }
            }
            group("Customer Details")
            {
                Caption = 'Customer Details';
                Visible = CustomerFound;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Name';
                }
                group(Control1000000050)
                {
                    Caption = 'Address';
                    field(Address; Rec.Address)
                    {
                        ApplicationArea = All;
                        Caption = 'Address';
                    }
                    field("Address 2"; Rec."Address 2")
                    {
                        ApplicationArea = All;
                        Caption = 'Address 2';
                    }
                    field(City; Rec.City)
                    {
                        ApplicationArea = All;
                        Caption = 'City';
                    }
                    field(County; Rec.County)
                    {
                        ApplicationArea = All;
                        Caption = 'County';
                    }
                    field("Post Code"; Rec."Post Code")
                    {
                        ApplicationArea = All;
                        Caption = 'Post Code';
                    }
                    field("Country Code"; Rec."Country/Region Code")
                    {
                        ApplicationArea = All;
                        Caption = 'Country';
                    }
                    field("Salesperson Code"; Rec."Salesperson Code")
                    {
                        ApplicationArea = All;
                        Editable = false;
                        Caption = 'Salesperson';
                    }

                }
                group(Control1000000033)
                {
                    Caption = 'Communication';
                    field("Phone No."; Rec."Phone No.")
                    {
                        ApplicationArea = All;
                        Caption = 'Telephone';
                    }
                    field("E-Mail"; Rec."E-Mail")
                    {
                        ApplicationArea = All;
                        Caption = 'Email';
                    }
                }
                group(Finance)
                {
                    Caption = 'Finance';
                    field(Balance; Rec.Balance)
                    {
                        ApplicationArea = All;
                        Caption = 'Balance';
                    }
                    field("Balance (LCY)"; Rec."Balance (LCY)")
                    {
                        ApplicationArea = All;
                        Caption = 'Balance (LCY)';
                    }
                    field("Credit Limit (LCY)"; Rec."Credit Limit (LCY)")
                    {
                        Editable = false;
                        ApplicationArea = All;
                        Caption = 'Credit Limit';
                    }
                }
                group("Sales Info.")
                {
                    Caption = 'Sales Info.';
                    field("Contact No."; Rec."Primary Contact No.")
                    {
                        ApplicationArea = All;
                        Caption = 'Contact';
                    }
                    field("Customer Price Group"; Rec."Customer Price Group")
                    {
                        ApplicationArea = All;
                        Caption = 'Cust. Price Group';
                    }
                }
                group("Related Documents")
                {
                    Caption = 'Related Documents';
                    Visible = false;
                    group(Unposted)
                    {
                        Caption = 'Unposted';
                        field("No. of Quotes"; Rec."No. of Quotes")
                        {
                            ApplicationArea = All;
                            Caption = 'No. of Quotes';
                        }
                        field("No. of Blanket Orders"; Rec."No. of Blanket Orders")
                        {
                            ApplicationArea = All;
                            Caption = 'No. of Blanket Orders';
                        }
                        field("No. of Orders"; Rec."No. of Orders")
                        {
                            ApplicationArea = All;
                            Caption = 'No. of Orders';
                        }
                        field("No. of Invoices"; Rec."No. of Invoices")
                        {
                            ApplicationArea = All;
                            Caption = 'No. of Invoices';
                        }
                        field("No. of Return Orders"; Rec."No. of Return Orders")
                        {
                            ApplicationArea = All;
                            Caption = 'No. of Return Orders';
                        }
                        field("No. of Credit Memos"; Rec."No. of Credit Memos")
                        {
                            ApplicationArea = All;
                            Caption = 'No. of Credits';
                        }
                    }
                    group(Posted)
                    {
                        Caption = 'Posted';
                        field("No. of Pstd. Invoices"; Rec."No. of Pstd. Invoices")
                        {
                            ApplicationArea = All;
                            Caption = 'No. of Posted Invoices';
                        }
                        field("No. of Pstd. Return Receipts"; Rec."No. of Pstd. Return Receipts")
                        {
                            ApplicationArea = All;
                            Caption = 'No. of Posted Returns';
                        }
                        field("No. of Pstd. Credit Memos"; Rec."No. of Pstd. Credit Memos")
                        {
                            ApplicationArea = All;
                            Caption = 'No. of Posted Credits';
                        }
                    }
                }
            }
            part(CustomerSearchCues; "NP Customer Search Cues")
            {
                Caption = 'Customer Info';
                SubPageLink = "Customer No." = field("No.");
                Visible = CustomerFound;
                ApplicationArea = All;
            }
        }
        area(factboxes)
        {
            part(CustomerStatisticsFactBox; "Customer Statistics FactBox")
            {
                SubPageLink = "No." = FIELD("No."),
                                          "Currency Filter" = FIELD("Currency Filter"),
                                          "Date Filter" = FIELD("Date Filter"),
                                          "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                          "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                Visible = CustomerFound;
                ApplicationArea = All;
            }
            part(CustomerDetailsFactBox; "Customer Details FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("No."),
                                          "Currency Filter" = FIELD("Currency Filter"),
                                          "Date Filter" = FIELD("Date Filter"),
                                          "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                          "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                Visible = CustomerFound;
            }
            systempart(Control1000000079; Links)
            {
                Visible = false;
                ApplicationArea = All;
            }
            systempart(Control1000000071; Notes)
            {
                Visible = false;
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Search)
            {
                Caption = 'Search';
                action("Find Customer")
                {
                    Image = Find;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Ctrl+F';
                    Visible = CustomerNotFound;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        Customer: Record Customer;
                        CustomerList: Page "Customer List";
                        SalesHeader: Record "Sales Header";
                        SalesOrderList: Page "Sales Orders";
                        SalesOrderCard: Page "Sales Order";
                        SalesShipmentHeader: Record "Sales Shipment Header";
                        SalesShipmentCard: Page "Posted Sales Shipment";
                        SalesShipmentList: Page "Posted Sales Shipments";
                    begin
                        Rec.Reset();
                        //Search for Order
                        if Var_Order_No_ <> '' then begin
                            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
                            SalesHeader.SetFilter("No.", '%1', Var_Order_No_);
                            if SalesHeader.FindSet() then begin
                                if SalesHeader.Count() = 1 then begin
                                    Rec.Get(SalesHeader."Sell-to Customer No.");
                                    SetCustomerFound(true);
                                    SalesOrderCard.SetRecord(SalesHeader);
                                    SalesOrderCard.Run();

                                end else begin
                                    SalesOrderList.SetTableView(SalesHeader);
                                    SalesOrderList.LookupMode := true;

                                    if SalesOrderList.RunModal() = ACTION::LookupOK then begin
                                        SalesOrderList.GetRecord(SalesHeader);
                                        Rec.Get(SalesHeader."Sell-to Customer No.");
                                        SetCustomerFound(true);
                                        SalesOrderCard.SetRecord(SalesHeader);
                                        SalesOrderCard.Run();
                                    end;
                                end;
                            end else begin
                                SalesShipmentHeader.SetFilter("Order No.", '%1', Var_Order_No_);
                                if SalesShipmentHeader.FindSet() then begin
                                    if SalesShipmentHeader.Count() = 1 then begin
                                        Rec.Get(SalesShipmentHeader."Sell-to Customer No.");
                                        SetCustomerFound(true);
                                        SalesShipmentCard.SetRecord(SalesShipmentHeader);
                                        SalesShipmentCard.Run();
                                    end else begin
                                        SalesShipmentList.SetTableView(SalesShipmentHeader);
                                        SalesShipmentList.LookupMode := true;
                                        if SalesShipmentList.RunModal() = ACTION::LookupOK then begin
                                            SalesShipmentList.GetRecord(SalesShipmentHeader);
                                            SalesShipmentCard.SetRecord(SalesShipmentHeader);
                                            Rec.Get(SalesShipmentHeader."Sell-to Customer No.");
                                            SetCustomerFound(true);
                                            SalesShipmentCard.SetRecord(SalesShipmentHeader);
                                            SalesShipmentCard.Run();
                                        end;
                                    end;
                                end else
                                    Message(Text_NoMatchingOrder, Var_Order_No_);
                            end;

                            CurrPage.Update(false);
                            exit;
                        end;

                        //Search for Shipment
                        if Var_Shipment_No_ <> '' then begin
                            SalesShipmentHeader.SetFilter("No.", '%1', Var_Shipment_No_);
                            if SalesShipmentHeader.FindSet() then begin
                                if SalesShipmentHeader.Count() = 1 then begin
                                    SalesShipmentCard.SetRecord(SalesShipmentHeader);
                                    Rec.Get(SalesShipmentHeader."Sell-to Customer No.");
                                    SetCustomerFound(true);
                                    SalesShipmentCard.SetRecord(SalesShipmentHeader);
                                    SalesShipmentCard.Run();
                                end else begin
                                    SalesShipmentList.SetTableView(SalesShipmentHeader);
                                    SalesShipmentList.LookupMode := true;
                                    if SalesShipmentList.RunModal() = ACTION::LookupOK then begin
                                        SalesShipmentList.GetRecord(SalesShipmentHeader);
                                        SalesShipmentCard.SetRecord(SalesShipmentHeader);
                                        Rec.Get(SalesShipmentHeader."Sell-to Customer No.");
                                        SetCustomerFound(true);
                                        SalesShipmentCard.SetRecord(SalesShipmentHeader);
                                        SalesShipmentCard.Run();
                                    end;
                                end;
                            end else
                                Message(Text_NoMatchingShipment, Var_Shipment_No_);

                            CurrPage.Update(false);
                            exit;
                        end;

                        //Search for Customer
                        if Var_No_ <> '' then Customer.SetFilter("No.", StrSubstNo('%1', Var_No_));
                        if Var_Name <> '' then Customer.SetFilter(Name, StrSubstNo('@*%1*', Var_Name));
                        if Var_Address <> '' then Customer.SetFilter(Address, StrSubstNo('@*%1*', Var_Address));
                        if Var_Address_2 <> '' then Customer.SetFilter("Address 2", StrSubstNo('@*%1*', Var_Address_2));
                        if Var_City <> '' then Customer.SetFilter(City, StrSubstNo('@*%1*', Var_City));
                        if Var_County <> '' then Customer.SetFilter(County, StrSubstNo('@*%1*', Var_County));
                        if Var_Country_Code <> '' then Customer.SetFilter("Country/Region Code", StrSubstNo('@*%1*', Var_Country_Code));
                        if Var_Post_Code <> '' then Customer.SetFilter("Post Code", StrSubstNo('@*%1*', Var_Post_Code));
                        if Var_Phone_No_ <> '' then Customer.SetFilter("Phone No.", StrSubstNo('@*%1*', Var_Phone_No_));
                        if "Var_E-Mail" <> '' then Customer.SetFilter("E-Mail", StrSubstNo('@*%1*', "Var_E-Mail"));

                        if Customer.FindSet() then begin
                            if Customer.Count() = 1 then begin
                                if not ConfirmCustomer(Customer) then begin
                                    SetCustomerFound(false);
                                    exit;
                                end;
                                Rec.Get(Customer."No.");
                                Rec.SetRecFilter();
                                SetCustomerFound(true);
                            end else begin
                                CustomerList.SetTableView(Customer);
                                CustomerList.LookupMode := true;
                                if CustomerList.RunModal() = ACTION::LookupOK then begin
                                    CustomerList.GetRecord(Customer);
                                    Rec.Get(Customer."No.");
                                    Rec.SetRecFilter();
                                    SetCustomerFound(true);
                                end;
                            end;
                        end else
                            Error(Text_NoMatchingCustomer);
                        CurrPage.Update(false);
                    end;
                }
                action("Start Again")
                {
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        SetCustomerFound(false);

                        Var_No_ := '';
                        Var_Name := '';
                        Var_Address := '';
                        Var_Address_2 := '';
                        Var_City := '';
                        Var_County := '';
                        Var_Post_Code := '';
                        Var_Country_Code := '';
                        Var_Phone_No_ := '';
                        "Var_E-Mail" := '';

                        Var_Order_No_ := '';
                        Var_Shipment_No_ := '';

                        CurrPage.Update();
                    end;
                }
                action("Update Cues and Contacts")
                {
                    Image = Refresh;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;
                    RunObject = codeunit "NP Customer Search Cues Mgmt";
                }
            }
            group(New)
            {
                Caption = 'New';
                action("New User Task")
                {
                    Image = Task;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    Visible = CustomerFound;
                    ApplicationArea = All;
                    Caption = 'New User Task';
                    ToolTip = 'Create a User Task linked to this Customer';
                    trigger OnAction()
                    var
                        UserTask: Record "User Task";
                        UserTaskCard: Page "User Task Card";
                    begin
                        UserTask.Init();
                        UserTask.Validate("NP Customer No.", Rec."No.");
                        UserTask.Insert(true);

                        UserTaskCard.SetRecord(UserTask);
                        UserTaskCard.Run();
                    end;
                }
            }
            group(Show)
            {
                Caption = 'Show';
                action("Show Sales Documents")
                {
                    Image = Sales;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        ShowDocTabs := not ShowDocTabs;
                    end;
                }
            }
        }
        area(navigation)
        {
            action("Full Customer Card")
            {
                Image = Customer;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Customer Card";
                RunPageLink = "No." = FIELD("No.");
                Visible = CustomerFound;
                ApplicationArea = All;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetCustomerFound(CustomerFound);
        OnCustomerFound(CustomerFound);
    end;

    trigger OnOpenPage()
    begin
        if not CustomerFound then
            SetCustomerFound(false);
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
        Var_City: Text[50];
        Var_County: Text[50];
        Var_Post_Code: Text[50];
        Var_Phone_No_: Text[50];
        "Var_E-Mail": Text[50];
        Var_Order_No_: Code[20];
        Var_Shipment_No_: Code[20];
        Var_Country_Code: Code[10];
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


    procedure SetCustomerFound(SetTo: Boolean)
    var
        CustomerSearchCue: Record "NP Customer Search Cue";
        CustomerSearchCuesMgmt: Codeunit "NP Customer Search Cues Mgmt";
    begin
        CustomerFound := SetTo;
        CustomerNotFound := not SetTo;
        ShowDocTabs := true;

        if CustomerSearchCue.IsEmpty() then
            CustomerSearchCuesMgmt.Run();

        if SetTo then begin
            DataCaption := Rec."No." + ' - ' + Rec.Name;
            Rec.CalcFields(Balance,
                       "No. of Quotes",
                       "No. of Orders",
                       "No. of Invoices",
                       "No. of Pstd. Shipments",
                       "No. of Pstd. Invoices"
                       );
            HasOpenLedgerEntries := Rec.Balance <> 0;
            HasSalesQuotes := ShowDocTabs and (Rec."No. of Quotes" <> 0);
            HasSalesOrders := ShowDocTabs and (Rec."No. of Orders" <> 0);
            HasSalesInvoices := ShowDocTabs and (Rec."No. of Invoices" <> 0);
            HasSalesShipments := ShowDocTabs and (Rec."No. of Pstd. Shipments" <> 0);
            HasPostedInvoices := ShowDocTabs and (Rec."No. of Pstd. Invoices" <> 0);
        end else begin
            DataCaption := Text_DataCaption_NotWindows;
            HasOpenLedgerEntries := false;
            HasSalesQuotes := false;
            HasSalesOrders := false;
            HasSalesInvoices := false;
            HasSalesShipments := false;
            HasPostedInvoices := false;
        end;
    end;


    procedure SetCustomer(Customer: Record Customer)
    begin
        Rec.Get(Customer."No.");
        SetCustomerFound(true);
    end;

    local procedure ConfirmCustomer(Customer: Record Customer) Confirmed: Boolean
    var
        CustomerSearchConfirmation: Page "NP Customer Search Conf";
    begin
        CustomerSearchConfirmation.SetRecord(Customer);
        exit(CustomerSearchConfirmation.RunModal() = ACTION::Yes);
    end;
}