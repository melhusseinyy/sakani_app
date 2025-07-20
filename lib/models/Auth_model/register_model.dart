class RegisterModel {
  final String name;
  final String? email;
  final String phone;
  final String password;
  final String countryCode;
  final String countryId;
  final String? invitaionCode;
  final String clientType;

  RegisterModel({
    required this.name,
    this.email,
    required this.phone,
    required this.password,
    required this.countryCode,
    required this.countryId,
    this.invitaionCode,
    required this.clientType,
  });
  factory RegisterModel.fromjson(jsondata) {
    return RegisterModel(
      name: jsondata['name'],
      phone: jsondata['phone'],
      email: jsondata['email'],
      password: jsondata['password'],
      countryCode: jsondata['country_code'],
      countryId: jsondata['country_id'],
      invitaionCode: jsondata['invitation_code'],
      clientType: jsondata['client type'],
    );
  }
}
