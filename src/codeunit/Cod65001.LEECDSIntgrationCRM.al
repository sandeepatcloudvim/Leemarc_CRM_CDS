codeunit 60100 "LEE_CDS_IntgrationCRM"
{
    trigger OnRun()
    begin

    end;

    procedure InsertIntegrationFieldMapping(IntegrationTableMappingName: Code[20]; TableFieldNo: Integer; IntegrationTableFieldNo: Integer; SynchDirection: Option; ConstValue: Text; ValidateField: Boolean; ValidateIntegrationTableField: Boolean)
    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
    begin
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, TableFieldNo, IntegrationTableFieldNo, SynchDirection,
            ConstValue, ValidateField, ValidateIntegrationTableField);
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", 'OnAfterResetConfiguration', '', true, true)]
    local procedure HandleOnAfterResetConfiguration(CDSConnectionSetup: Record "CDS Connection Setup")
    var
        IntegrationTableMapping: Record "Integration Table Mapping";
        IntegrationFieldMapping: Record "Integration Field Mapping";
        CRMAccount: Record "CRM Account";
        CustomerRec: Record Customer;
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
        CRMIntegrationRecord: Record "CRM Integration Record";
    begin
        IF CRMIntegrationManagement.IsCRMIntegrationEnabled then begin
            InsertIntegrationFieldMapping(
               'CUSTOMER',
               CustomerRec.FIELDNO("Global Dimension 1 Code"),
               CRMAccount.FieldNo(CRMAccount.new_Brand),
               IntegrationFieldMapping.Direction::Bidirectional,
               '', true, FALSE);
        end;
    end;


}