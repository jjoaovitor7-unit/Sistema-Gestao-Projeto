import 'package:equatable/equatable.dart';

class ParticipationModel extends Equatable {
  final String id;
  final String userId;
  final String taskId;
  final String projectId;
  final String researcherId;

  ParticipationModel({
    this.id,
    this.userId,
    this.taskId,
    this.projectId,
    this.researcherId,
  });

  factory ParticipationModel.fromJson(Map<String, dynamic> json) {
    return ParticipationModel(
      id: json['id'],
      userId: json['userId'],
      taskId: json['taskId'],
      projectId: json['projectId'],
      researcherId: json['researcherId'],
    );
  }

  @override
  List<dynamic> get props {
    return <dynamic>[
      this.id,
      this.userId,
      this.taskId,
      this.projectId,
      this.researcherId,
    ];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['taskId'] = this.taskId;
    data['projectId'] = this.projectId;
    data['researcherId'] = this.researcherId;
    return data;
  }
}
