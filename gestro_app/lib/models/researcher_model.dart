import 'package:equatable/equatable.dart';

class ResearcherModel extends Equatable {
  final String id;
  final String type;
  final String curriculum;
  final bool activationStatus;
  final String userId;

  ResearcherModel({
    this.id,
    this.type,
    this.curriculum,
    this.activationStatus,
    this.userId,
  });

  factory ResearcherModel.fromJson(Map<String, dynamic> json) {
    return ResearcherModel(
      id: json['id'],
      type: json['type'],
      curriculum: json['curriculum'],
      activationStatus: json['activationStatus'],
      userId: json['userId'],
    );
  }

  @override
  List<dynamic> get props {
    return <dynamic>[
      this.id,
      this.type,
      this.curriculum,
      this.activationStatus,
      this.userId,
    ];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['curriculum'] = this.curriculum;
    data['activationStatus'] = this.activationStatus;
    data['userId'] = this.userId;
    return data;
  }
}
