/*class User {
  int id;
  String name;
  String deviceid;

  User(int id, String name, String deviceid) {
    this.id = id;
    this.name = name;
    this.deviceid = deviceid;
  }

  User.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        deviceid = json['device_id'];

  Map toJson() {
    return {'id': id, 'name': name, 'device_id': deviceid};
  }
}*/

class User {
  int id;
  String name;
  String email;

  User(int id, String name, String email) {
    this.id = id;
    this.name = name;
    this.email = email;
  }

  User.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        email = json['email'];

  Map toJson() {
    return {'id': id, 'name': name, 'email': email};
  }
}
