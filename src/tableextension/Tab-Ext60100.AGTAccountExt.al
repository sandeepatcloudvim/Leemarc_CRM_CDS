tableextension 60100 "AGT CRMAccountExt" extends "CRM Account"
{
    Description = 'Business that represents a customer or potential customer. The company that is billed in business transactions.';

    fields
    {
        field(60000; new_Brand; Text[100])
        {
            ExternalName = 'new_brand';
            ExternalType = 'String';
            Description = 'Brand';
            Caption = 'Brand';
        }
    }
}