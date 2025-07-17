public class GetAllPartnersQueueable implements Queueable {
    @TestVisible
    private static ICommunityPortalService communityPortalService = (ICommunityPortalService) Application.Service.newInstance(
        ICommunityPortalService.class
    );

    public void execute(QueueableContext context) {
        List<Partner__c> partners = communityPortalService.getAllPortalPartners();
        System.debug('Found ' + partners.size() + ' partners.');
    }
}