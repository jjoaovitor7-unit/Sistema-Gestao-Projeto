import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final DocumentReference idUser;
  final String name;
  final String email;
  final String type;

  UserModel({
    this.idUser,
    this.name,
    this.type,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, DocumentReference id) {
    print(
        "====================================================================================================================================== $json");
    return UserModel(
      idUser: id,
      name: json['name'],
      type: json['type'],
      email: json['email'],
    );
  }

  @override
  List<dynamic> get props {
    return <dynamic>[
      this.name,
      this.type,
      this.email,
    ];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['email'] = this.type;
    return data;
  }
}
