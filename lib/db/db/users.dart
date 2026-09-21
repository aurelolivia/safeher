class User {
  int? id;
  String nama;
  String email;
  String nomorHp;
  String password;
  String asalKota;

  User({
    this.id,
    required this.nama,
    required this.email,
    required this.nomorHp,
    required this.password,
    required this.asalKota,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'email': email,
      'nomor_hp': nomorHp,
      'password': password,
      'asal_kota': asalKota,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      nama: map['nama'],
      email: map['email'],
      nomorHp: map['nomor_hp'],
      password: map['password'],
      asalKota: map['asal_kota'],
    );
  }
}