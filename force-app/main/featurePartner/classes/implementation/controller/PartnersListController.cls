public with sharing class PartnersListController {
    @TestVisible
    private static ICommunityPortalService communityPortalService = (ICommunityPortalService) Application.Service.newInstance(
        ICommunityPortalService.class
    );

    @AuraEnabled(Cacheable=true)
    public static List<Partner__c> getAllPartners(){
        try {
            return communityPortalService.getAllPortalPartners();
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}