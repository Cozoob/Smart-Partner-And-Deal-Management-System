@RestResource(urlMapping='/partners')
global with sharing class PartnersRestApi {
    @TestVisible
    private static ICommunityPortalService communityPortalService = (ICommunityPortalService) Application.Service.newInstance(
        ICommunityPortalService.class
    );

    @HttpGet
    global static List<Partner__c> getPartners() {
        try {
            return communityPortalService.getAllPortalPartners();
        } catch(Exception e) {
            RestContext.response.statusCode = 500;
            RestContext.response.responseBody = Blob.valueOf(e.getMessage());
            return null;
        }
    }
}