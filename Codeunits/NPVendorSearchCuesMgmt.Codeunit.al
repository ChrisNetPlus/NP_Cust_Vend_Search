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
}