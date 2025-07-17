@IsTest
private class PartnersTest {

    // this will fail if the Custom Metadata records have not been setup
    @IsTest
    static void newInstanceTest() {
        IPartners instanceByIds = Partners.newInstance(
            new Set<Id>{ fflib_IDGenerator.generate(Partner__c.SObjectType) }
        );
        IPartners instanceByRecords = Partners.newInstance(new List<Partner__c>());
        Assert.isTrue(true, 'Expected no errors');
    }
  
 // TODO, (GenericTestFactory is a centralised place to create test data for mocking)
//     @IsTest
//     static void insertAndUpdateOnRecords() {
//     // Test insert, update and delete fires off triggers properly
//         List<PortalUser__c> portalUsers = new List<PortalUser__c>{
//             GenericTestFactory.createPortalUser(),
//             GenericTestFactory.createPortalUser(),
//             GenericTestFactory.createPortalUser()
//         };
//         insert portalUsers;
//         update portalUsers;
//         delete portalUsers;
//         Assert.isTrue(true, 'Expected no errors');
//     }
  
//   @IsTest
//   static void validateUserSsoTest() {
//     // TODO: mock selector and/or service methods before running the domain class method
//     List<PortalUser__c> portalUsers = new List<PortalUser__c>{
//       GenericTestFactory.createPortalUser(),
//       GenericTestFactory.createPortalUser(),
//       GenericTestFactory.createPortalUser()
//     };
 
//     IPortalUsers portalUsersDomain = (IPortalUsers) Application.Domain.newInstance(portalUsers);
//     portalUsersDomain.validateUserSso();
//   }
}