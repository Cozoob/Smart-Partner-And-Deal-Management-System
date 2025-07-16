trigger PartnerTrigger on Partner__c (before insert, before update) {
    fflib_SObjectDomain.triggerHandler(Partners.class);
}