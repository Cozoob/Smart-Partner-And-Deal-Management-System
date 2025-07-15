public interface IPartnerSelector extends IApplicationSObjectSelector {
    List<Partner__c> selectById(Set<Id> idSet);
    Partner__c selectById(Id recordId);
    List<Partner__c> selectAll();
}