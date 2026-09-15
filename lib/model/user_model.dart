class UserModel {
  final int? id;
  final String email;
  final String nama;
  final String hobi;
  final String password;

  UserModel({
    this.id,
    required this.email,
    required this.nama,
    required this.hobi,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'nama': nama,
      'hobi': hobi,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      nama: map['nama'],
      hobi: map['hobi'],
      password: map['password'],
    );
  }
}