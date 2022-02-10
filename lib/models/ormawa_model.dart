part of 'models.dart';

class OrmawaModel {
  final String? id;
  final String? ormawa;

  OrmawaModel({this.id, this.ormawa});

  factory OrmawaModel.fromJson(Map<String, dynamic> json) {
    return OrmawaModel(
      id: json['id'],
      ormawa: json['ormawa'],
    );
  }
}
