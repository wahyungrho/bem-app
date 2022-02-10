part of 'models.dart';

class EventModel {
  final String? id;
  final String? title;
  final String? description;
  final String? date;
  final String? time;
  final String? location;
  final String? createdBy;
  final String? createdAt;
  final String? organizedBy;
  final String? categoryEvent;
  final String? status;

  EventModel({
    this.id,
    this.title,
    this.description,
    this.date,
    this.time,
    this.location,
    this.createdBy,
    this.createdAt,
    this.organizedBy,
    this.categoryEvent,
    this.status,
  });

  factory EventModel.fromJSON(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
      location: json['location'],
      createdBy: json['created_by'],
      createdAt: json['created_at'],
      organizedBy: json['organized_by'],
      categoryEvent: json['category_event'],
      status: json['status'],
    );
  }
}
