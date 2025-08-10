class UserModel {
  final bool status;
  final int id;
  final String token;
  final String image;
  final bool isVerified;
  final String name;
  final String? email;
  final String phone;
  final String code;
  final CountryModel country;
  final bool enableNotification;
  final int clientType;

  UserModel({
    required this.status,
    required this.id,
    required this.token,
    required this.image,
    required this.isVerified,
    required this.name,
    required this.email,
    required this.phone,
    required this.code,
    required this.country,
    required this.enableNotification,
    required this.clientType,
  });

  factory UserModel.fromjson(Map<String, dynamic> jsondata) {
    return UserModel(
      id: jsondata['id'],
      name: jsondata['name'],
      phone: jsondata['phone'],
      email: jsondata['email'],
      token: jsondata['api_token'],
      image: jsondata['image'],
      isVerified: jsondata['is_verified'],
      clientType: jsondata['client_type'],
      enableNotification: jsondata['enable_notification'],
      country: CountryModel.fromJson(jsondata['country']),
      status: jsondata['status'],
      code: jsondata['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'id': id,
      'api_token': token,
      'image': image,
      'is_verified': isVerified,
      'name': name,
      'email': email,
      'phone': phone,
      'code': code,
      'country': country.toJson(),
      'enable_notification': enableNotification,
      'client_type': clientType,
    };
  }
}

class CountryModel {
  final int id;
  final String title;

  CountryModel({required this.id, required this.title});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(id: json['id'], title: json['title']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
