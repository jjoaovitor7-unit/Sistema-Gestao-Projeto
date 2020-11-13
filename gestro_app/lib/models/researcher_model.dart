import 'package:equatable/equatable.dart';

class ResearcherModel extends Equatable {
  final String type;
  final String curriculum;
  final bool activationStatus;
  final String userId;

  ResearcherModel({
    this.type,
    this.curriculum,
    this.activationStatus,
    this.userId,
  });

  factory ResearcherModel.fromJson(Map<String, dynamic> json) {
    return ResearcherModel(
      type: json['type'],
      curriculum: json['curriculum'],
      activationStatus: json['activationStatus'],
      userId: json['userId'],
    );
  }

  @override
  List<dynamic> get props {
    return <dynamic>[
      this.type,
      this.curriculum,
      this.activationStatus,
      this.userId,
    ];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['curriculum'] = this.curriculum;
    data['activationStatus'] = this.activationStatus;
    data['userId'] = this.userId;
    return data;
  }
}
