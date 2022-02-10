part of 'models.dart';

class StaffModel {
  final String? id;
  final String? roleID;
  final String? name;
  final String? periode;
  final String? position;
  final String? email;
  final String? status;
  final String? createdAt;

  StaffModel({
    this.id,
    this.roleID,
    this.name,
    this.periode,
    this.position,
    this.email,
    this.status,
    this.createdAt,
  });

  factory StaffModel.fromJson(Map<String, dynamic> json) {
    return StaffModel(
      id: json['id'],
      roleID: json['roleID'],
      name: json['nama_anggota'],
      periode: json['periode'],
      position: json['jabatan'],
      email: json['email'],
      status: json['status'],
      createdAt: json['createdAt'],
    );
  }
}
