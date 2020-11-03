import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final bool completationStatus;
  final DateTime deadline;
  final DateTime startedAt;
  final String projectId;

  TaskModel({
    this.id,
    this.name,
    this.description,
    this.completationStatus,
    this.deadline,
    this.startedAt,
    this.projectId,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
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
      this.id,
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
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['completationStatus'] = this.completationStatus;
    data['deadline'] = this.deadline;
    data['startedAt'] = this.startedAt;
    data['projectId'] = this.projectId;
    return data;
  }
}
