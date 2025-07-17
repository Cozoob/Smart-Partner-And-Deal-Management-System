public inherited sharing class Partners extends ApplicationSObjectDomain implements IPartners {
    public static IPartners newInstance(List<Partner__c> records) {
        return (IPartners) Application.Domain.newInstance(records);
    }

    public static IPartners newInstance(Set<Id> recordIds) {
        return (IPartners) Application.Domain.newInstance(recordIds);
    }

    public Partners(List<Partner__c> records) {
        super(records);
    }

    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Partners(sObjectList);
        }
    }

    public override void onBeforeInsert() {
        this.setPendingStatus();
    }

    public override void onBeforeUpdate(Map<Id, SObject> existingRecords) {
        this.setActiveStatus();
    }

    public Map<Id, Boolean> validateEmail() {
        return validateEmail((List<Partner__c>) getRecords());
    }

    public Map<Id, Boolean> validateNotBlankExternalId() {
        return validateNotBlankExternalId((List<Partner__c>) getRecords());
    }

    private Map<Id, Boolean> validateEmail(List<Partner__c> partners) {
        Map<Id, Boolean> validations = new Map<Id, Boolean>();
        // todo
        return validations;
    }

    private Map<Id, Boolean> validateNotBlankExternalId(List<Partner__c> partners) {
        Map<Id, Boolean> validations = new Map<Id, Boolean>();
        // todo
        return validations;
    }

    private void setPendingStatus() {
        for(Partner__c partner : (List<Partner__c>) getRecords()) {
            partner.Status__c = 'Pending';
        }
    }

     private void setActiveStatus() {
        for(Partner__c partner : (List<Partner__c>) getRecords()) {
            partner.Status__c = 'Active';
        }
    }

    private void generateUniqueExternalId() {
         for(Partner__c partner : (List<Partner__c>) getRecords()) {
            if(String.isBlank(partner.External_Id__c)) {
                  Long rand = Crypto.getRandomLong();
                    String raw = String.valueOf(rand) + System.currentTimeMillis();
                    Blob hash = Crypto.generateDigest('SHA-256', Blob.valueOf(raw));
                    partner.External_Id__c = EncodingUtil.convertToHex(hash).substring(0, 16);
            }
        }
    }
}