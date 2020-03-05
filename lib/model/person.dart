class Person {
  int personId;
  String name;
  String profilePhotoUri;

  Person({this.personId, this.name, this.profilePhotoUri});

  Person.fromJson(Map<String, dynamic> json) {
    personId = json['personId'];
    name = json['name'];
    profilePhotoUri = json['profilePhotoUri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['personId'] = this.personId;
    data['name'] = this.name;
    data['profilePhotoUri'] = this.profilePhotoUri;
    return data;
  }
}