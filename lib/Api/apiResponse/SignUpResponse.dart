
class SignUpResponse {
  int? id;
  bool? isActive;
  bool? isStaff;
  bool success=false;
  SignUpResponse(
      {this.id,
        this.isActive,
        this.isStaff});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    if(json['id']!=null)
      {
        success=true;
    id = json['id'];
    isActive = json['is_active'];
    isStaff = json['is_staff'];
      }else
        {
          success=false;
        }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_active'] = this.isActive;
    data['is_staff'] = this.isStaff;
    return data;
  }
}