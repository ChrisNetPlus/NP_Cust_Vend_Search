codeunit 50204 "NP Customer Search Cues Mgmt"
{
    trigger OnRun()
    begin
        UpdateAllCustomerCues();
    end;

    local procedure UpdateAllCustomerCues()
    var
        Customer: Record Customer;
        CustomerSearchCue: Record "NP Customer Search Cue";
    begin
        CustomerSearchCue.DeleteAll();

        if Customer.FindSet() then
            repeat
                if not CustomerSearchCue.Get(Customer."No.") then begin
                    Clear(CustomerSearchCue);
                    CustomerSearchCue.Init();
                    CustomerSearchCue.Validate("Customer No.", Customer."No.");
                    CustomerSearchCue.Insert(true);
                end;
            until Customer.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterInsertEvent', '', false, false)]
    local procedure Customer_OnAfterInsert(var Rec: Record Customer; RunTrigger: Boolean)
    var
        CustomerSearchCue: Record "NP Customer Search Cue";
    begin
        if Rec.IsTemporary() then
            exit;

        if not CustomerSearchCue.Get(Rec."No.") then begin
            Clear(CustomerSearchCue);
            CustomerSearchCue.Init();
            CustomerSearchCue.Validate("Customer No.", Rec."No.");
            CustomerSearchCue.Insert(true);
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterDeleteEvent', '', false, false)]
    local procedure Customer_OnAfterDelete(var Rec: Record Customer; RunTrigger: Boolean)
    var
        CustomerSearchCue: Record "NP Customer Search Cue";
    begin
        if Rec.IsTemporary() then
            exit;

        if CustomerSearchCue.Get(Rec."No.") then
            CustomerSearchCue.Delete(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterRenameEvent', '', false, false)]
    local procedure Customer_OnAfterRename(var Rec: Record Customer; var xRec: Record Customer; RunTrigger: Boolean)
    var
        CustomerSearchCue: Record "NP Customer Search Cue";
    begin
        if Rec.IsTemporary() then
            exit;

        if CustomerSearchCue.Get(xRec."No.") then
            CustomerSearchCue.Rename(Rec."No.");
    end;
}