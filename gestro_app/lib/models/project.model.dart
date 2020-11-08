import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ProjectModel extends Equatable {
  final String name;
  final String description;
  final Timestamp startedAt;
  final bool activationStatus;

  ProjectModel({
    this.name,
    this.description,
    this.startedAt,
    this.activationStatus,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      name: json['name'],
      description: json['description'],
      startedAt: json['startedAt'],
      activationStatus: json['activationStatus'],
    );
  }

  @override
  List<dynamic> get props {
    return <dynamic>[
      this.name,
      this.description,
      this.startedAt,
      this.activationStatus
    ];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['startedAt'] = this.startedAt;
    data['activationStatus'] = this.activationStatus;
    return data;
  }
}
