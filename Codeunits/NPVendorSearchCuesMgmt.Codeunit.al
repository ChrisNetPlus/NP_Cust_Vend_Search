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
}