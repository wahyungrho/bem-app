part of 'models.dart';

class MeetingModel {
  final String? id;
  final String? tema;
  final String? subtema;
  final String? date;
  final String? time;
  final String? location;
  final String? createdBy;
  final String? createdAt;
  final String? status;

  MeetingModel({
    this.id,
    this.tema,
    this.subtema,
    this.date,
    this.time,
    this.location,
    this.createdBy,
    this.createdAt,
    this.status,
  });

  factory MeetingModel.fromJson(Map<String, dynamic> json) {
    return MeetingModel(
      id: json['id'],
      tema: json['tema'],
      subtema: json['subtema'],
      date: json['tgl_rapat'],
      time: json['time'],
      location: json['lokasi'],
      createdBy: json['created_by'],
      createdAt: json['created_at'],
      status: json['status'],
    );
  }
}
