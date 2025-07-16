@IsTest(IsParallel=true)
private class PartnerSelectorTest {
    private static final SObjectType SOBJECT_TYPE = Partner__c.SObjectType;
    private static final List<Partner__c> EMPTY_LIST = new List<Partner__c>();

    /* Generic tests all selectors have */
    @IsTest
    static void shouldReturnRecordSObjectType() {
        PartnerSelector selector = PartnerSelector.newInstance();
        Assert.areEqual(
            SOBJECT_TYPE,
            selector.getSObjectType(),
            'Expected object type returned correctly'
        );
    }

    @IsTest
    static void shouldReturnQueryFactory() {
        PartnerSelector selector = PartnerSelector.newInstance();
        Assert.areNotEqual(
            null,
            selector.getQueryFactory(),
            'Expected a query factory returned'
        );
    }

    @IsTest
    static void shouldReturnObjectFieldList() {
        PartnerSelector selector = PartnerSelector.newInstance();
        Assert.areNotEqual(
            null,
            selector.getSObjectFieldList(),
            'Expected field list returned'
        );
    }

    @IsTest
    static void shouldNotGetErrorsOnGettingAdditionalFieldsList() {
        PartnerSelector selector = PartnerSelector.newInstance();
        selector.getAdditionalSObjectFieldList();
        Assert.isTrue(true, 'Expected no errors');
    }

    @IsTest
    static void shouldReturnEmptyListWhenSelectByIdHasEmptySetParameterVal() {
        PartnerSelector selector = PartnerSelector.newInstance();
        Assert.areEqual(
            EMPTY_LIST,
            selector.selectById(new Set<Id>()),
            'Expected empty list because there is no id values in the Set'
        );
    }

    @IsTest
    static void shouldReturnEmptyListWhenSelectByIdSetDoesNotExist() {
        PartnerSelector selector = PartnerSelector.newInstance();
        Assert.areEqual(
            EMPTY_LIST,
            selector.selectById(
            new Set<Id>{ fflib_IDGenerator.generate(SOBJECT_TYPE) }
            ),
            'Expected empty list because record id value does not exist'
        );
    }

    @IsTest
    static void shouldReturnEmptyListWhenSelectByIdDoesNotExist() {
        PartnerSelector selector = PartnerSelector.newInstance();
        Assert.areEqual(
            null,
            selector.selectById(fflib_IDGenerator.generate(SOBJECT_TYPE)),
            'Expected null because record id value does not exist'
        );
    }

    @IsTest
    static void shouldReturnEmptyListWhenSelectSObjectsByIdSetDoesNotExist() {
        PartnerSelector selector = PartnerSelector.newInstance();
        Assert.areEqual(
            new List<SObject>(),
            selector.selectSObjectsById(
            new Set<Id>{ fflib_IDGenerator.generate(SOBJECT_TYPE) }
            ),
            'Expected empty list because record id value does not exist'
        );
    }

    /* Selector specific tests */
    @IsTest
    static void testSelectAll() {
        PartnerSelector selector = PartnerSelector.newInstance();
        Assert.areEqual(
            EMPTY_LIST,
            selector.selectAll(),
            'Expected empty list because there have been no test records inserted'
        );
    }
}