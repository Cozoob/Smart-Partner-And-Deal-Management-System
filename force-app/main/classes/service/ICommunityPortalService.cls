public interface ICommunityPortalService {
    List<Partner__c> getAllPortalPartners();
    Boolean isUserLoggedIn(Id userId);
}