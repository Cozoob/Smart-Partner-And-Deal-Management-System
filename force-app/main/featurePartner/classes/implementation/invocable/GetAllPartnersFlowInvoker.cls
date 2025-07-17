public with sharing class GetAllPartnersFlowInvoker {
    @TestVisible
    private static ICommunityPortalService communityPortalService = (ICommunityPortalService) Application.Service.newInstance(
        ICommunityPortalService.class
    );
    
    @InvocableMethod(label='Get All Partners' description='Returns all partner records')
    public static List<PartnerOutput> invoke() {
        List<Partner__c> partners = communityPortalService.getAllPortalPartners();
        List<PartnerOutput> output = new List<PartnerOutput>();

        for(Partner__c partner : partners) {
            output.add(new PartnerOutput(partner.Id, partner.Name));
        }
        return output;
    }

    public class PartnerOutput {
        @InvocableVariable public Id partnerId;
        @InvocableVariable public String partnerName;

        public PartnerOutput(Id id, String name) {
            this.partnerId = id;
            this.partnerName = name;
        }
    }
}