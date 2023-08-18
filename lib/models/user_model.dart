class UserModel {
  final String? name;
  final String? email;
  final String? passsword;
  final String? photo;
  UserModel({this.name, this.email, this.passsword, this.photo});
  factory UserModel.fromJon(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      passsword: json['password'],
      photo: json['photo'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': passsword,
      'photo': photo,
    };
  }
}
