abstract class ContactsState{}

class ContactsInitial extends ContactsState {}

class InsertContactsLoadingState extends ContactsState {}
class InsertContactsSuccessState extends ContactsState {}
class InsertContactsErrorState extends ContactsState {}

class GetContactsLoadingState extends ContactsState {}
class GetContactsSuccessState extends ContactsState {}
class GetContactsErrorState extends ContactsState {}


class UpdateContactsLoadingState extends ContactsState {}
class UpdateContactsSuccessState extends ContactsState {}
class UpdateContactsErrorState extends ContactsState {}



class DeleteContactsLoadingState extends ContactsState {}
class DeleteContactsSuccessState extends ContactsState {}
class DeleteContactsErrorState extends ContactsState {}