import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String name;
  final String description;
  final bool completationStatus;
  final Timestamp deadline;
  // final Timestamp startedAt;
  final DocumentReference projectId;

  TaskModel({
    this.name,
    this.description,
    this.completationStatus,
    this.deadline,
    // this.startedAt,
    this.projectId,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json, DocumentReference id) {
    return TaskModel(
      name: json['name'],
      description: json['description'],
      completationStatus: json['completationStatus'],
      deadline: json['deadline'],
      // startedAt: json['startedAt'],
      projectId: id,
    );
  }

  @override
  List<dynamic> get props {
    return <dynamic>[
      this.name,
      this.description,
      this.completationStatus,
      this.deadline,
      // this.startedAt,
    ];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['completationStatus'] = this.completationStatus;
    data['deadline'] = this.deadline;
    // data['startedAt'] = this.startedAt;
    return data;
  }
}
