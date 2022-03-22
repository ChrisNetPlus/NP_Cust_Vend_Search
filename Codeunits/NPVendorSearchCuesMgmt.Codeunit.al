codeunit 50205 "NP Vendor Search Cues Mgmt"
{
    trigger OnRun()
    begin
        UpdateAllVendorCues();
    end;

    local procedure UpdateAllVendorCues()
    var
        Vendor: Record Vendor;
        VendorSearchCue: Record "NP Vendor Search Cue";
    begin
        VendorSearchCue.DeleteAll();

        if Vendor.FindSet() then
            repeat
                if not VendorSearchCue.Get(Vendor."No.") then begin
                    Clear(VendorSearchCue);
                    VendorSearchCue.Init();
                    VendorSearchCue.Validate("Vendor No.", Vendor."No.");
                    VendorSearchCue.Insert(true);
                end;
            until Vendor.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterInsertEvent', '', false, false)]
    local procedure Customer_OnAfterInsert(var Rec: Record Customer; RunTrigger: Boolean)
    var
        VendorSearchCue: Record "NP Vendor Search Cue";
    begin
        if Rec.IsTemporary() then
            exit;

        if not VendorSearchCue.Get(Rec."No.") then begin
            Clear(VendorSearchCue);
            VendorSearchCue.Init();
            VendorSearchCue.Validate("Vendor No.", Rec."No.");
            VendorSearchCue.Insert(true);
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterDeleteEvent', '', false, false)]
    local procedure Customer_OnAfterDelete(var Rec: Record Customer; RunTrigger: Boolean)
    var
        VendorSearchCue: Record "NP Vendor Search Cue";
    begin
        if Rec.IsTemporary() then
            exit;

        if VendorSearchCue.Get(Rec."No.") then
            VendorSearchCue.Delete(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterRenameEvent', '', false, false)]
    local procedure Customer_OnAfterRename(var Rec: Record Customer; var xRec: Record Customer; RunTrigger: Boolean)
    var
        VendorSearchCue: Record "NP Vendor Search Cue";
    begin
        if Rec.IsTemporary() then
            exit;

        if VendorSearchCue.Get(xRec."No.") then
            VendorSearchCue.Rename(Rec."No.");
    end;

    procedure CreateTxtFile()
    var
        CreatedUser: Record User;
        ModifiedUser: Record User;
        Vendor: Record Vendor;
        PurchaseLine: Record "Purchase Line";
        PurchaseHeader: Record "Purchase Header";
        DimensionSetEntry: Record "Dimension Set Entry";
        BlobFile: Codeunit "Temp Blob";
        TempBlob: Codeunit "Temp Blob";
        InStr: InStream;
        OutStr: OutStream;
        CR: char;
        LF: char;
        Line: text;
        GangCode: Text;
        GangName: Text;
        FileName: Text;
        LineDescription: Text[100];
        Window: Dialog;
        RunDownload: Label 'Do you want to download all open purchase order lines to Excel?';
    begin
        if Confirm(RunDownload, false) then begin
            Window.Open('##1###################');
            FileName := 'Outstanding_Purchase_Orders.csv';
            TempBlob.CreateOutStream(OutStr);
            Clear(Line);
            CR := 13;
            LF := 10;
            Line := 'PO Number' + ',';
            Line := Line + 'Line No.' + ',';
            Line := Line + 'Type' + ',';
            Line := Line + 'Item No.' + ',';
            Line := Line + 'Item Description' + ',';
            Line := Line + 'Vendor No.' + ',';
            Line := Line + 'Vendor Name' + ',';
            Line := Line + 'Order Date' + ',';
            Line := Line + 'Order Qty.' + ',';
            Line := Line + 'Outstanding Qty.' + ',';
            Line := Line + 'Outstanding Amount' + ',';
            Line := Line + 'Unit Cost' + ',';
            Line := Line + 'Created By' + ',';
            Line := Line + 'Created On' + ',';
            Line := Line + 'Modified By' + ',';
            Line := Line + 'Modified On' + ',';
            Line := Line + 'Contract' + ',';
            Line := Line + 'Workstream' + ',';
            Line := Line + 'Gang Code' + ',';
            Line := Line + 'Gang Name';
            OutStr.WriteText(Line + CR + LF);

            PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Order);
            PurchaseLine.SetFilter(Type, '<>%1', PurchaseLine.Type::" ");
            PurchaseLine.SetFilter("Outstanding Amount", '<>%1', 0);
            if PurchaseLine.FindSet() then
                repeat
                    CR := 13;
                    LF := 10;
                    Clear(GangCode);
                    Clear(GangName);
                    Clear(LineDescription);
                    LineDescription := PurchaseLine.Description;
                    LineDescription := DelChr(LineDescription, '=', ',');
                    LineDescription := DelChr(LineDescription, '=', Format(CR));
                    LineDescription := DelChr(LineDescription, '=', Format(LF));
                    Window.Update(1, PurchaseLine."Document No.");
                    PurchaseHeader.Reset();
                    PurchaseHeader.SetRange("No.", PurchaseLine."Document No.");
                    if PurchaseHeader.FindFirst() then;
                    DimensionSetEntry.Reset();
                    DimensionSetEntry.SetRange("Dimension Set ID", PurchaseLine."Dimension Set ID");
                    DimensionSetEntry.SetRange("Dimension Code", 'GANG');
                    if DimensionSetEntry.FindFirst() then begin
                        DimensionSetEntry.CalcFields("Dimension Value Name");
                        GangCode := DimensionSetEntry."Dimension Value Code";
                        GangName := DimensionSetEntry."Dimension Value Name";
                    end;
                    if Vendor.Get(PurchaseLine."Buy-from Vendor No.") then;
                    CreatedUser.Get(PurchaseLine.SystemCreatedBy);
                    ModifiedUser.Get(PurchaseLine.SystemModifiedBy);
                    Line := PurchaseLine."Document No." + ',';
                    Line := Line + Format(PurchaseLine."Line No.") + ',';
                    Line := Line + Format(PurchaseLine.Type) + ',';
                    Line := Line + PurchaseLine."No." + ',';
                    Line := Line + LineDescription + ',';
                    Line := Line + PurchaseHeader."Buy-from Vendor No." + ',';
                    Line := Line + Vendor.Name + ',';
                    Line := Line + Format(PurchaseHeader."Order Date") + ',';
                    Line := Line + DelChr(Format(PurchaseLine.Quantity), '=', ',') + ',';
                    Line := Line + DelChr(Format(PurchaseLine."Outstanding Quantity"), '=', ',') + ',';
                    Line := Line + DelChr(Format(PurchaseLine."Outstanding Amount"), '=', ',') + ',';
                    Line := Line + DelChr(Format(PurchaseLine."Direct Unit Cost"), '=', ',') + ',';
                    Line := Line + CreatedUser."User Name" + ',';
                    Line := Line + Format(PurchaseLine.SystemCreatedAt) + ',';
                    Line := Line + ModifiedUser."User Name" + ',';
                    Line := Line + Format(PurchaseLine.SystemModifiedAt) + ',';
                    Line := Line + PurchaseLine."Shortcut Dimension 1 Code" + ',';
                    Line := Line + PurchaseLine."Shortcut Dimension 2 Code" + ',';
                    Line := Line + GangCode + ',';
                    Line := Line + GangName;
                    OutStr.WriteText(Line + CR + LF);
                Until PurchaseLine.Next() = 0;
            TempBlob.CreateInStream(InStr);
            DownloadFromStream(InStr, '', '', '', FileName);
            Window.Close();
        end;
    end;

    procedure CreatePOInfoFile(var FromDate: Date; ToDate: Date)
    var
        CreatedUser: Record User;
        ModifiedUser: Record User;
        Vendor: Record Vendor;
        PurchaseLine: Record "Purchase Line";
        PurchaseHeader: Record "Purchase Header";
        PurchaseInvHdr: Record "Purch. Inv. Header";
        PurchaseInvLine: Record "Purch. Inv. Line";
        PurchCredHdr: Record "Purch. Cr. Memo Hdr.";
        PurchCredLine: Record "Purch. Cr. Memo Line";
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        GLAccount: Record "G/L Account";
        Item: Record Item;
        BlobFile: Codeunit "Temp Blob";
        TempBlob: Codeunit "Temp Blob";
        InStr: InStream;
        OutStr: OutStream;
        CR: char;
        LF: char;
        Line: text;
        FileName: Text;
        LineDescription: Text[100];
        ItemDescription: Text[100];
        VLDescription: Text[100];
        ItemType: Text[20];
        Window: Dialog;
        RunDownload: Label 'Do you want to download all Purchase Info to Excel?';
    begin
        if Confirm(RunDownload, false) then begin
            Window.Open('##1###################');
            FileName := 'Purchase_Orders_Info.csv';
            TempBlob.CreateOutStream(OutStr);
            Clear(Line);
            CR := 13;
            LF := 10;
            Line := 'Posting Date' + ',';
            Line := Line + 'Document Type' + ',';
            Line := Line + 'Document No.' + ',';
            Line := Line + 'External Document No.' + ',';
            Line := Line + 'Vendor No.' + ',';
            Line := Line + 'Vendor Name' + ',';
            Line := Line + 'Description' + ',';
            Line := Line + 'Amount Excl. VAT' + ',';
            Line := Line + 'PO Number' + ',';
            Line := Line + 'Line No.' + ',';
            Line := Line + 'Order Date' + ',';
            Line := Line + 'Item / GL No.' + ',';
            Line := Line + 'Item / GL Name' + ',';
            Line := Line + 'Line Description' + ',';
            Line := Line + 'Line Amount' + ',';
            Line := Line + 'Item Type' + ',';
            Line := Line + 'Contract' + ',';
            Line := Line + 'Workstream' + ',';
            Line := Line + 'Posting Description' + ',';
            Line := Line + 'Type' + ',';
            Line := Line + 'Created By' + ',';
            Line := Line + 'Created On' + ',';
            Line := Line + 'Modified By' + ',';
            Line := Line + 'Modified On';

            OutStr.WriteText(Line + CR + LF);

            PurchaseInvLine.SetFilter("Posting Date", '%1..%2', FromDate, ToDate);
            PurchaseInvLine.SetFilter(Type, '<>%1', PurchaseInvLine.Type::" ");
            PurchaseInvLine.SetFilter(Quantity, '>%1', 0);
            if PurchaseInvLine.FindSet() then
                repeat
                    CR := 13;
                    LF := 10;
                    PurchaseInvHdr.Reset();
                    PurchaseInvHdr.SetRange("No.", PurchaseInvLine."Document No.");
                    PurchaseInvHdr.SetFilter("Order No.", '<>%1', '');
                    if PurchaseInvHdr.FindFirst() then begin
                        VendorLedgerEntry.SetRange("Document Type", VendorLedgerEntry."Document Type"::Invoice);
                        VendorLedgerEntry.SetRange("Document No.", PurchaseInvLine."Document No.");
                        if VendorLedgerEntry.FindSet() then begin
                            Clear(LineDescription);
                            Clear(ItemDescription);
                            Clear(ItemType);
                            Clear(VLDescription);
                            if PurchaseInvLine.Type = PurchaseInvLine.Type::Item then begin
                                Item.Get(PurchaseInvLine."No.");
                                ItemDescription := Item.Description;
                                if Item.Type = Item.Type::"Non-Inventory" then
                                    ItemType := 'NON INVENTORY'
                                else
                                    ItemType := 'INVENTORY';
                            end else
                                if PurchaseInvLine.Type = PurchaseInvLine.Type::"G/L Account" then begin
                                    GLAccount.Get(PurchaseInvLine."No.");
                                    ItemDescription := GLAccount.Name;
                                    ItemType := 'NON INVENTORY';
                                end;
                            ItemDescription := DelChr(ItemDescription, '=', ',');
                            ItemDescription := DelChr(ItemDescription, '=', Format(CR));
                            ItemDescription := DelChr(ItemDescription, '=', Format(LF));
                            LineDescription := PurchaseInvLine.Description;
                            LineDescription := DelChr(LineDescription, '=', ',');
                            LineDescription := DelChr(LineDescription, '=', Format(CR));
                            LineDescription := DelChr(LineDescription, '=', Format(LF));
                            VLDescription := VendorLedgerEntry.Description;
                            VLDescription := DelChr(VLDescription, '=', ',');
                            VLDescription := DelChr(VLDescription, '=', Format(CR));
                            VLDescription := DelChr(VLDescription, '=', Format(LF));
                            Window.Update(1, PurchaseInvLine."Document No.");
                            if Vendor.Get(PurchaseInvLine."Buy-from Vendor No.") then;
                            CreatedUser.Get(PurchaseInvLine.SystemCreatedBy);
                            ModifiedUser.Get(PurchaseInvLine.SystemModifiedBy);
                            Line := Format(VendorLedgerEntry."Posting Date") + ',';
                            Line := Line + Format(VendorLedgerEntry."Document Type") + ',';
                            Line := Line + PurchaseInvLine."Document No." + ',';
                            Line := Line + VendorLedgerEntry."External Document No." + ',';
                            Line := Line + PurchaseInvHdr."Buy-from Vendor No." + ',';
                            Line := Line + Vendor.Name + ',';
                            Line := Line + VLDescription + ',';
                            Line := Line + DelChr(Format(Abs(PurchaseInvLine."Line Amount")), '=', ',') + ',';
                            Line := Line + PurchaseInvHdr."Order No." + ',';
                            Line := Line + Format(PurchaseInvLine."Line No.") + ',';
                            Line := Line + Format(PurchaseInvHdr."Order Date") + ',';
                            Line := Line + PurchaseInvLine."No." + ',';
                            Line := Line + ItemDescription + ',';
                            Line := Line + LineDescription + ',';
                            Line := Line + DelChr(Format(Abs(PurchaseInvLine."Line Amount")), '=', ',') + ',';
                            Line := Line + ItemType + ',';
                            Line := Line + PurchaseInvLine."Shortcut Dimension 1 Code" + ',';
                            Line := Line + PurchaseInvLine."Shortcut Dimension 2 Code" + ',';
                            Line := Line + PurchaseInvHdr."Posting Description" + ',';
                            Line := Line + Format(PurchaseInvLine.Type) + ',';
                            Line := Line + CreatedUser."User Name" + ',';
                            Line := Line + Format(PurchaseInvLine.SystemCreatedAt) + ',';
                            Line := Line + ModifiedUser."User Name" + ',';
                            Line := Line + Format(PurchaseInvLine.SystemModifiedAt);
                            OutStr.WriteText(Line + CR + LF);
                        end;
                    end;
                until PurchaseInvLine.Next() = 0;
            PurchCredLine.SetFilter("Posting Date", '%1..%2', FromDate, ToDate);
            PurchCredLine.SetFilter(Type, '<>%1', PurchCredLine.Type::" ");
            PurchCredLine.SetFilter(Quantity, '>%1', 0);
            if PurchCredLine.FindSet() then
                repeat
                    CR := 13;
                    LF := 10;
                    VendorLedgerEntry.SetRange("Document Type", VendorLedgerEntry."Document Type"::"Credit Memo");
                    VendorLedgerEntry.SetRange("Document No.", PurchCredLine."Document No.");
                    if VendorLedgerEntry.FindSet() then begin
                        Clear(LineDescription);
                        Clear(ItemDescription);
                        Clear(ItemType);
                        Clear(VLDescription);
                        if PurchCredLine.Type = PurchCredLine.Type::Item then begin
                            Item.Get(PurchCredLine."No.");
                            ItemDescription := Item.Description;
                            if Item.Type = Item.Type::"Non-Inventory" then
                                ItemType := 'NON INVENTORY'
                            else
                                ItemType := 'INVENTORY';
                        end else
                            if PurchCredLine.Type = PurchCredLine.Type::"G/L Account" then begin
                                GLAccount.Get(PurchCredLine."No.");
                                ItemDescription := GLAccount.Name;
                                ItemType := 'NON INVENTORY';
                            end;
                        ItemDescription := DelChr(ItemDescription, '=', ',');
                        ItemDescription := DelChr(ItemDescription, '=', Format(CR));
                        ItemDescription := DelChr(ItemDescription, '=', Format(LF));
                        LineDescription := PurchCredLine.Description;
                        LineDescription := DelChr(LineDescription, '=', ',');
                        LineDescription := DelChr(LineDescription, '=', Format(CR));
                        LineDescription := DelChr(LineDescription, '=', Format(LF));
                        VLDescription := VendorLedgerEntry.Description;
                        VLDescription := DelChr(VLDescription, '=', ',');
                        VLDescription := DelChr(VLDescription, '=', Format(CR));
                        VLDescription := DelChr(VLDescription, '=', Format(LF));
                        Window.Update(1, PurchCredLine."Document No.");
                        PurchCredHdr.Reset();
                        PurchCredHdr.SetRange("No.", PurchCredLine."Document No.");
                        if PurchCredHdr.FindFirst() then;
                        if Vendor.Get(PurchCredLine."Buy-from Vendor No.") then;
                        CreatedUser.Get(PurchCredLine.SystemCreatedBy);
                        ModifiedUser.Get(PurchCredLine.SystemModifiedBy);
                        Line := Format(VendorLedgerEntry."Posting Date") + ',';
                        Line := Line + Format(VendorLedgerEntry."Document Type") + ',';
                        Line := Line + PurchCredLine."Document No." + ',';
                        Line := Line + VendorLedgerEntry."External Document No." + ',';
                        Line := Line + PurchCredHdr."Buy-from Vendor No." + ',';
                        Line := Line + Vendor.Name + ',';
                        Line := Line + VLDescription + ',';
                        Line := Line + DelChr(Format(Abs(PurchCredLine."Line Amount")), '=', ',') + ',';
                        Line := Line + '' + ',';
                        Line := Line + Format(PurchCredLine."Line No.") + ',';
                        Line := Line + Format(PurchCredHdr."Posting Date") + ',';
                        Line := Line + PurchCredLine."No." + ',';
                        Line := Line + ItemDescription + ',';
                        Line := Line + LineDescription + ',';
                        Line := Line + DelChr(Format(Abs(PurchCredLine."Line Amount")), '=', ',') + ',';
                        Line := Line + ItemType + ',';
                        Line := Line + PurchCredLine."Shortcut Dimension 1 Code" + ',';
                        Line := Line + PurchCredLine."Shortcut Dimension 2 Code" + ',';
                        Line := Line + PurchCredHdr."Posting Description" + ',';
                        Line := Line + Format(PurchCredLine.Type) + ',';
                        Line := Line + CreatedUser."User Name" + ',';
                        Line := Line + Format(PurchCredLine.SystemCreatedAt) + ',';
                        Line := Line + ModifiedUser."User Name" + ',';
                        Line := Line + Format(PurchCredLine.SystemModifiedAt);
                        OutStr.WriteText(Line + CR + LF);
                    end;
                until PurchaseInvLine.Next() = 0;
            TempBlob.CreateInStream(InStr);
            DownloadFromStream(InStr, '', '', '', FileName);
            Window.Close();
        end;
    end;

}