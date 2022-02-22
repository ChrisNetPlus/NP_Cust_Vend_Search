page 50009 "NP Vendor Search"
{
    Caption = 'Vendor Search';
    DataCaptionExpression = DataCaption;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Sales';
    SourceTable = Vendor;
    UsageCategory = Tasks;
    ApplicationArea = All;
    Permissions = tabledata "NP Vendor Search Cue" = RIMD;
    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'Vendor Search';
                Visible = VendorNotFound;
                field("Var_No_"; Var_No_)
                {
                    Caption = 'No.';
                    ApplicationArea = All;
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
            group("Vendor Details")
            {
                Caption = 'Vendor Details';
                Visible = VendorFound;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                group(Control1000000050)
                {
                    Caption = 'Address';
                    field(Address; Rec.Address)
                    {
                        ApplicationArea = All;
                    }
                    field("Address 2"; Rec."Address 2")
                    {
                        ApplicationArea = All;
                    }
                    field(City; Rec.City)
                    {
                        ApplicationArea = All;
                    }
                    field(County; Rec.County)
                    {
                        ApplicationArea = All;
                    }
                    field("Post Code"; Rec."Post Code")
                    {
                        ApplicationArea = All;
                    }
                    field("Country Code"; Rec."Country/Region Code")
                    {
                        ApplicationArea = All;
                    }

                }
                group(Control1000000033)
                {
                    Caption = 'Communication';
                    field("Phone No."; Rec."Phone No.")
                    {
                        ApplicationArea = All;
                    }
                    field("E-Mail"; Rec."E-Mail")
                    {
                        ApplicationArea = All;
                    }
                }
                group(Finance)
                {
                    Caption = 'Finance';
                    field(Balance; Rec.Balance)
                    {
                        ApplicationArea = All;
                    }
                    field("Balance (LCY)"; Rec."Balance (LCY)")
                    {
                        ApplicationArea = All;
                    }
                }
                group("Sales Info.")
                {
                    Caption = 'Sales Info.';
                    field("Contact No."; Rec."Primary Contact No.")
                    {
                        ApplicationArea = All;
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
                        }
                        field("No. of Blanket Orders"; Rec."No. of Blanket Orders")
                        {
                            ApplicationArea = All;
                        }
                        field("No. of Orders"; Rec."No. of Orders")
                        {
                            ApplicationArea = All;
                        }
                        field("No. of Invoices"; Rec."No. of Invoices")
                        {
                            ApplicationArea = All;
                        }
                        field("No. of Return Orders"; Rec."No. of Return Orders")
                        {
                            ApplicationArea = All;
                        }
                        field("No. of Credit Memos"; Rec."No. of Credit Memos")
                        {
                            ApplicationArea = All;
                        }
                    }
                    group(Posted)
                    {
                        Caption = 'Posted';
                        field("No. of Pstd. Invoices"; Rec."No. of Pstd. Invoices")
                        {
                            ApplicationArea = All;
                        }
                        field("No. of Pstd. Credit Memos"; Rec."No. of Pstd. Credit Memos")
                        {
                            ApplicationArea = All;
                        }
                    }
                }
            }
            part(VendorSearchCues; "NP Vendor Search Cues")
            {
                Caption = 'Vendor Info';
                SubPageLink = "Vendor No." = field("No.");
                Visible = VendorFound;
                ApplicationArea = All;
            }
        }
        area(factboxes)
        {
            part(VendorStatisticsFactBox; "Vendor Statistics FactBox")
            {
                SubPageLink = "No." = FIELD("No."),
                                          "Currency Filter" = FIELD("Currency Filter"),
                                          "Date Filter" = FIELD("Date Filter"),
                                          "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                          "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                Visible = VendorFound;
                ApplicationArea = All;
            }
            part(VendorDetailsFactBox; "Vendor Details FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("No."),
                                          "Currency Filter" = FIELD("Currency Filter"),
                                          "Date Filter" = FIELD("Date Filter"),
                                          "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                          "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                Visible = VendorFound;
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
                action("Find Vendor")
                {
                    Image = Find;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Ctrl+F';
                    Visible = VendorNotFound;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        Vendor: Record Vendor;
                        VendorList: Page "Vendor List";
                        PurchaseHeader: Record "Purchase Header";
                        PurchaseOrderList: Page "Purchase Orders";
                        PurchaseOrderCard: Page "Purchase Order";
                    begin
                        Rec.Reset();
                        //Search for Order
                        if Var_Order_No_ <> '' then begin
                            PurchaseHeader.SetRange("Document Type", PurchaseHeader."Document Type"::Order);
                            PurchaseHeader.SetFilter("No.", '%1', Var_Order_No_);
                            if PurchaseHeader.FindSet() then begin
                                if PurchaseHeader.Count() = 1 then begin
                                    Rec.Get(PurchaseHeader."Buy-from Vendor No.");
                                    SetVendorFound(true);
                                    PurchaseOrderCard.SetRecord(PurchaseHeader);
                                    PurchaseOrderCard.Run();

                                end else begin
                                    PurchaseOrderList.SetTableView(PurchaseHeader);
                                    PurchaseOrderList.LookupMode := true;

                                    if PurchaseOrderList.RunModal() = ACTION::LookupOK then begin
                                        PurchaseOrderList.GetRecord(PurchaseHeader);
                                        Rec.Get(PurchaseHeader."Buy-from Vendor No.");
                                        SetVendorFound(true);
                                        PurchaseOrderCard.SetRecord(PurchaseHeader);
                                        PurchaseOrderCard.Run();
                                    end;
                                end;
                            end else
                                Message(Text_NoMatchingOrder, Var_Order_No_);

                            CurrPage.Update(false);
                            exit;
                        end;

                        //Search for Vendor
                        if Var_No_ <> '' then Vendor.SetFilter("No.", StrSubstNo('%1', Var_No_));
                        if Var_Name <> '' then Vendor.SetFilter(Name, StrSubstNo('@*%1*', Var_Name));
                        if Var_Address <> '' then Vendor.SetFilter(Address, StrSubstNo('@*%1*', Var_Address));
                        if Var_Address_2 <> '' then Vendor.SetFilter("Address 2", StrSubstNo('@*%1*', Var_Address_2));
                        if Var_City <> '' then Vendor.SetFilter(City, StrSubstNo('@*%1*', Var_City));
                        if Var_County <> '' then Vendor.SetFilter(County, StrSubstNo('@*%1*', Var_County));
                        if Var_Country_Code <> '' then Vendor.SetFilter("Country/Region Code", StrSubstNo('@*%1*', Var_Country_Code));
                        if Var_Post_Code <> '' then Vendor.SetFilter("Post Code", StrSubstNo('@*%1*', Var_Post_Code));
                        if Var_Phone_No_ <> '' then Vendor.SetFilter("Phone No.", StrSubstNo('@*%1*', Var_Phone_No_));
                        if "Var_E-Mail" <> '' then Vendor.SetFilter("E-Mail", StrSubstNo('@*%1*', "Var_E-Mail"));

                        if Vendor.FindSet() then begin
                            if Vendor.Count() = 1 then begin
                                if not ConfirmVendor(Vendor) then begin
                                    SetVendorFound(false);
                                    exit;
                                end;
                                Rec.Get(Vendor."No.");
                                Rec.SetRecFilter();
                                SetVendorFound(true);
                            end else begin
                                VendorList.SetTableView(Vendor);
                                VendorList.LookupMode := true;
                                if VendorList.RunModal() = ACTION::LookupOK then begin
                                    VendorList.GetRecord(Vendor);
                                    Rec.Get(Vendor."No.");
                                    Rec.SetRecFilter();
                                    SetVendorFound(true);
                                end;
                            end;
                        end else
                            Error(Text_NoMatchingVendor);
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
                        SetVendorFound(false);

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
                    RunObject = codeunit "NP Vendor Search Cues Mgmt";
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
                    Visible = VendorFound;
                    ApplicationArea = All;
                    Caption = 'New User Task';
                    ToolTip = 'Create a User Task linked to this Vendor';

                    trigger OnAction()
                    var
                        UserTask: Record "User Task";
                        UserTaskCard: Page "User Task Card";
                    begin
                        UserTask.Init();
                        UserTask.Validate("NP Vendor No.", Rec."No.");
                        UserTask.Insert(true);

                        UserTask.Modify(true);

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
            action("Full Vendor Card")
            {
                Image = Vendor;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Vendor Card";
                RunPageLink = "No." = FIELD("No.");
                Visible = VendorFound;
                ApplicationArea = All;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetVendorFound(VendorFound);
        OnVendorFound(VendorFound);
    end;



    var
        [InDataSet]
        VendorNotFound: Boolean;
        [InDataSet]
        VendorFound: Boolean;
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
        //Var_Master_Order_No_: Code[50];
        Var_Country_Code: Code[10];
        ShowDocTabs: Boolean;
        [InDataSet]
        HasOpenLedgerEntries: Boolean;
        [InDataSet]
        HasPurchaseOrders: Boolean;
        [InDataSet]
        HasPurchaseInvoices: Boolean;
        [InDataSet]
        HasPostedInvoices: Boolean;
        Text_DataCaption_NotWindows: Label 'Please enter the search details and press "Find Vendor"';
        Text_NoMatchingVendor: Label 'No matching Vendor found';
        Text_NoMatchingOrder: Label 'Sorry, no Order was found matching "%1". Please search using different information';

    [BusinessEvent(true)]
    procedure OnVendorFound(pVendorFound: Boolean)
    begin

    end;

    procedure SetVendorFound(SetTo: Boolean)
    var
        VendorSearchCue: Record "NP Vendor Search Cue";
        VendorSearchCuesMgmt: Codeunit "NP Vendor Search Cues Mgmt";
    begin
        VendorFound := SetTo;
        VendorNotFound := not SetTo;
        ShowDocTabs := true;

        if VendorSearchCue.IsEmpty() then
            VendorSearchCuesMgmt.Run();

        if SetTo then begin
            DataCaption := Rec."No." + ' - ' + Rec.Name;
            Rec.CalcFields(Balance,
                       "No. of Quotes",
                       "No. of Orders",
                       "No. of Invoices",
                       "No. of Pstd. Invoices"
                       );
            HasOpenLedgerEntries := Rec.Balance <> 0;
            HasPurchaseOrders := ShowDocTabs and (Rec."No. of Orders" <> 0);
            HasPurchaseInvoices := ShowDocTabs and (Rec."No. of Invoices" <> 0);
            HasPostedInvoices := ShowDocTabs and (Rec."No. of Pstd. Invoices" <> 0);
        end else begin
            DataCaption := Text_DataCaption_NotWindows;
            HasOpenLedgerEntries := false;
            HasPurchaseOrders := false;
            HasPurchaseInvoices := false;
            HasPostedInvoices := false;
        end;
    end;

    procedure SetVendor(Vendor: Record Vendor)
    begin
        Rec.Get(Vendor."No.");
        SetVendorFound(true);
    end;

    local procedure ConfirmVendor(Vendor: Record Vendor) Confirmed: Boolean
    var
        VendorSearchConfirmation: Page "NP Vendor Search Conf";
    begin
        VendorSearchConfirmation.SetRecord(Vendor);
        exit(VendorSearchConfirmation.RunModal() = ACTION::Yes);
    end;
}