global with sharing class PartnersSoapApi {
    @TestVisible
    private static ICommunityPortalService communityPortalService = (ICommunityPortalService) Application.Service.newInstance(
        ICommunityPortalService.class
    );

    webService static PartnerWrapper[] getAllPartners() {
        try {
            List<Partner__c> partners = communityPortalService.getAllPortalPartners();
            List<PartnerWrapper> result = new List<PartnerWrapper>();

            for(Partner__c partner : partners) {
                result.add(new PartnerWrapper(partner.Id, partner.Name));
            }
            
            return result;
        } catch (Exception e) {
            throw new CalloutException('Error retrieving partners: ' + e.getMessage());
        }
    }

    global class PartnerWrapper {
        webService Id partnerId;
        webService String partnerName;

        global PartnerWrapper(Id id, String name) {
            this.partnerId = id;
            this.partnerName = name;
        }

        global PartnerWrapper() {}
    }
}