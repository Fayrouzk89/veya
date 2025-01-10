class VeraUser {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? role;
  String? birthdate;
  int? age;
  double? weight;
  double? height;
  String? weightUpdatedAt;
  String? bodyCompositionReport;
  int? channelId;
  MembershipPlan? membershipPlan;

  VeraUser(
      {this.id,
        this.username,
        this.email,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.role,
        this.birthdate,
        this.age,
        this.weight,
        this.height,
        this.weightUpdatedAt,
        this.bodyCompositionReport,
        this.channelId,
        this.membershipPlan});

  VeraUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    role = json['role'];
    birthdate = json['birthdate'];
    age = json['age'];
    weight = json['weight'].toDouble();
    height = json['height'].toDouble();
    weightUpdatedAt = json['weight_updated_at']??"";
    bodyCompositionReport = json['body_composition_report']??"";
    channelId = json['channel_id']??-1;
    membershipPlan = json['membership_plan'] != null
        ? new MembershipPlan.fromJson(json['membership_plan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone_number'] = this.phoneNumber;
    data['role'] = this.role;
    data['birthdate'] = this.birthdate;
    data['age'] = this.age;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['weight_updated_at'] = this.weightUpdatedAt;
    data['body_composition_report'] = this.bodyCompositionReport;
    data['channel_id'] = this.channelId;
    if (this.membershipPlan != null) {
      data['membership_plan'] = this.membershipPlan!.toJson();
    }
    return data;
  }
}

class MembershipPlan {
  String? name;
  List<String>? services;

  MembershipPlan({this.name, this.services});

  MembershipPlan.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    services = json['services'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['services'] = this.services;
    return data;
  }
}