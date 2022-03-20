part of 'models.dart';

class ProposalModel {
  final String? prokerID;
  final String? fullname;
  final String? userID;
  final String? nameOrmawa;
  final String? ormawaID;
  final String? tema;
  final String? description;
  final String? date;
  final String? time;
  final String? biaya;
  final String? location;
  final String? noteUsulan;
  final String? createddatetime;
  final String? statusUsulan;
  final String? noteProposal;
  final String? statusProposal;
  final String? pathFile;
  final String? costApprove;
  final String? costUse;
  final String? pathFileEvent;
  final String? pathFileCost;
  final String? statusEvent;

  ProposalModel({
    this.prokerID,
    this.fullname,
    this.userID,
    this.nameOrmawa,
    this.ormawaID,
    this.tema,
    this.description,
    this.date,
    this.time,
    this.biaya,
    this.location,
    this.noteUsulan,
    this.createddatetime,
    this.statusUsulan,
    this.noteProposal,
    this.statusProposal,
    this.pathFile,
    this.costApprove,
    this.costUse,
    this.pathFileEvent,
    this.pathFileCost,
    this.statusEvent,
  });

  factory ProposalModel.fromJson(Map<String, dynamic> json) {
    return ProposalModel(
      prokerID: json['prokerID'],
      fullname: json['fullname'],
      userID: json['userID'],
      nameOrmawa: json['nameOrmawa'],
      ormawaID: json['ormawaID'],
      tema: json['tema'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
      biaya: json['biaya'],
      location: json['location'],
      noteUsulan: json['noteUsulan'],
      createddatetime: json['createddatetime'],
      statusUsulan: json['statusUsulan'],
      noteProposal: json['noteProposal'],
      statusProposal: json['statusProposal'],
      pathFile: json['pathFile'],
      costApprove: json['cost_approve'],
      costUse: json['cost_use'],
      pathFileEvent: json['pathFileEvent'],
      pathFileCost: json['pathFileCost'],
      statusEvent: json['statusEvent'],
    );
  }
}
