public inherited sharing class Partners extends ApplicationSObjectDomain implements IPartners {
    private static final Set<String> REGIONS = new Set<String>{
        'APAC',
        'EMEA',
        'NA'
    };

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
        this.validateRegion(getRecords());
    }

    public override void onBeforeUpdate(Map<Id, SObject> existingRecords) {
        this.validateRegion(getChangedRecords(new Set<String>{ 'Region__c' }));
    }

    public Map<Id, Boolean> validateRegion() {
        return validateRegion((List<Partner__c>) getRecords());
    }

    public Map<Id, Boolean> validateRegion(List<Partner__c> partners) {
        Map<Id, Boolean> validations = new Map<Id, Boolean>();
        for (Partner__c partner : partners) {
            validations.put(partner.Id, REGIONS.contains(partner.Region__c));
        }
        return validations;
    }
}