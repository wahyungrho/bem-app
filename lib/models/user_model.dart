part of 'models.dart';

class UserModel {
  final String? id;
  final String? idRole;
  final String? ormawa;
  final String? fullname;
  final String? email;
  final String? telp;
  final String? createddatetime;
  final String? status;

  UserModel({
    this.id,
    this.idRole,
    this.ormawa,
    this.fullname,
    this.email,
    this.telp,
    this.createddatetime,
    this.status,
  });

  factory UserModel.fromJSON(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      idRole: json['id_role'],
      ormawa: json['ormawa'],
      fullname: json['fullname'],
      email: json['email'],
      telp: json['telp'],
      createddatetime: json['createddatetime'],
      status: json['status'],
    );
  }
}
