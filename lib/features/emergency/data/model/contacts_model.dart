class ContactsModel {
  final int? id;
  final String name;
  final String number;


  ContactsModel({
    this.id,
    required this.name,
    required this.number,

  });

  factory ContactsModel.fromJson(Map<String, dynamic> jsonData) {
    return ContactsModel(
      id: jsonData['id'] ,
      name: jsonData['name'] ,
      number: jsonData['number'],

    );
  }
}
