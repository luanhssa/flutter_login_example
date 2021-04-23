import 'dart:convert';

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.socialNumber,
    this.phone,
    this.birthDate,
    this.thumb,
  });

  factory User.fromJSON(Map<dynamic, dynamic>? json) {
    json ??= <String, dynamic>{};
    if (json.isEmpty) {
      return NullUser();
    }
    final birth = json['birthdate'];
    var birthDate = '';
    if (birth != null && birth is String) {
      if (birth.contains('/')) {
        birthDate = birth;
      } else if (birth.contains('-')) {
        birthDate = birth
            .split('-')
            .reversed
            .reduce((value, element) => '$value/$element');
      }
    }
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      socialNumber: json['cpf'],
      phone: json['phone'],
      birthDate: birthDate,
      thumb: json['picture'],
    );
  }

  factory User.fromString(String? string) {
    string ??= '';
    if (string.isEmpty) {
      return NullUser();
    } else {
      final Map<dynamic, dynamic> map = json.decode(string);
      return User.fromJSON(map);
    }
  }

  num? id;
  String? name;
  String? email;
  String? socialNumber;
  String? phone;
  String? thumb;
  String? birthDate;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'email': email,
        'cpf': socialNumber,
        'phone': phone,
        'birthdate': birthDate,
        'picture': thumb,
      };

  @override
  String toString() {
    return json.encode(toMap());
  }
}

class NullUser extends User {}
