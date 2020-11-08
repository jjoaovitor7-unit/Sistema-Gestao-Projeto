import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String name;
  final String description;
  final bool completationStatus;
  final Timestamp deadline;
  final Timestamp startedAt;
  final String projectId;

  TaskModel({
    this.name,
    this.description,
    this.completationStatus,
    this.deadline,
    this.startedAt,
    this.projectId,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      name: json['name'],
      description: json['description'],
      completationStatus: json['completationStatus'],
      deadline: json['deadline'],
      startedAt: json['startedAt'],
      projectId: json['projectId'],
    );
  }

  @override
  List<dynamic> get props {
    return <dynamic>[
      this.name,
      this.description,
      this.completationStatus,
      this.deadline,
      this.startedAt,
      this.projectId,
    ];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['completationStatus'] = this.completationStatus;
    data['deadline'] = this.deadline;
    data['startedAt'] = this.startedAt;
    data['projectId'] = this.projectId;
    return data;
  }
}
