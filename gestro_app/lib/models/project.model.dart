import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ProjectModel extends Equatable {
  final String name;
  // final String nameResearchers;
  final String description;
  final Timestamp startedAt;
  // final Timestamp endDate;
  final bool activationStatus;
  String pesquisador;

  final DocumentReference idProject;
  final Timestamp endedAt;

  ProjectModel(
      {this.name,
      // this.nameResearchers,
      this.description,
      this.startedAt,
      this.activationStatus,
      // this.endDate,
      this.idProject,
      this.endedAt,
      this.pesquisador});

  factory ProjectModel.fromJson(
      Map<String, dynamic> json, DocumentReference id) {
    return ProjectModel(
        name: json['name'],
        // nameResearchers: json['researchers'],

        description: json['description'],
        startedAt: json['startedAt'],
        activationStatus: json['activationStatus'],
        idProject: id,
        endedAt: json['endedAt'],
        pesquisador: json['pesquisador']);
  }

  @override
  List<dynamic> get props {
    return <dynamic>[
      this.name,
      this.description,
      this.startedAt,
      this.activationStatus,
      this.endedAt,
      this.pesquisador
    ];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['researchers'] = this.name;
    data['description'] = this.description;
    data['startedAt'] = this.startedAt;
    data['activationStatus'] = this.activationStatus;
    data['endedAt'] = this.endedAt;
    data['pesquisador'] = this.pesquisador;
    return data;
  }
}
