global with sharing class GetAllPartnersScheduler implements Schedulable {
    @TestVisible
    private static ICommunityPortalService communityPortalService = (ICommunityPortalService) Application.Service.newInstance(
        ICommunityPortalService.class
    );

    global void execute(SchedulableContext context) {
        List<Partner__c> partners = communityPortalService.getAllPortalPartners();
        System.debug('Scheduled job retrieved ' + partners.size() + ' partners.');
    }
}