import 'package:equatable/equatable.dart';

class ProjectModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String startedAt;
  final String activationStatus;

  ProjectModel({
    this.id,
    this.name,
    this.description,
    this.startedAt,
    this.activationStatus,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      startedAt: json['startedAt'],
      activationStatus: json['activationStatus'],
    );
  }

  @override
  List<dynamic> get props {
    return <dynamic>[
      this.id,
      this.name,
      this.description,
      this.startedAt,
      this.activationStatus
    ];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['startedAt'] = this.startedAt;
    data['activationStatus'] = this.activationStatus;
    return data;
  }
}
