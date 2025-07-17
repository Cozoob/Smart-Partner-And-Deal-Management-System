public inherited sharing class PartnerSelector extends ApplicationSObjectSelector implements IPartnerSelector {
    private List<Schema.SObjectField> selectedSObjectFields = new List<Schema.SObjectField>{
        Partner__c.Id
    };

    public static PartnerSelector newInstance() {
        return (PartnerSelector) Application.Selector.newInstance(Partner__c.SObjectType);
    }

    public Schema.SObjectType getSObjectType() {
        return Partner__c.SObjectType;
    }

    public fflib_QueryFactory getQueryFactory() {
        return new fflib_QueryFactory(getSObjectType());
    }

    public List<Schema.SObjectField> getSelectedSObjectFields() {
        return selectedSObjectFields;
    }

    public void setSelectedSObjectFields(Schema.SObjectField[] values) {
        this.selectedSObjectFields = values;
    }

    @TestVisible
    private List<Schema.SObjectField> getAdditionalSObjectFieldList() {
        return new List<Schema.SObjectField>{};
    }

    public List<Partner__c> selectById(Set<Id> idSet) {
        if(idSet.isEmpty()) {
            return new List<Partner__c>();
        }
        
        fflib_QueryFactory queryFactory = getQueryFactory();
        queryFactory.selectFields(getSelectedSObjectFields());
        queryFactory.setCondition('Id IN :idSet');
        return Database.query(queryFactory.toSOQL());
    }

    public Partner__c selectById(Id recordId) {
        List<Partner__c> partners = selectById(new Set<Id>{recordId});
        return partners.isEmpty() ? null : partners[0];
    }

    public List<Partner__c> selectAll() {
        fflib_QueryFactory queryFactory = getQueryFactory();
        queryFactory.selectFields(getSelectedSObjectFields());
        return Database.query(queryFactory.toSOQL());
    }
}