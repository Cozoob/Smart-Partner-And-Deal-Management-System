public inherited sharing class CommunityPortalService implements ICommunityPortalService {
    public List<Partner__c> getAllPortalPartners() {
        IPartnerSelector selector = (IPartnerSelector) Application.Selector.newInstance(
            Partner__c.SObjectType
        );
        return selector.selectAll();
    }
    
    public Boolean isUserLoggedIn(Id userId) {
        IPartners partners = (IPartners) Application.Domain.newInstance(
            new Set<Id>{userId}
        );
        Map<Id, Boolean> validatedPartnersByRegion = new  Map<Id, Boolean>();
        return validatedPartnersByRegion.get(userId);
    }
}