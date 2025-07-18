public interface IPartners extends IApplicationSObjectDomain {
    Map<Id, Boolean> validateEmail();
    Map<Id, Boolean> validateNotBlankExternalId();
}