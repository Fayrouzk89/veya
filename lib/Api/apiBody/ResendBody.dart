

class ResendBody{
  String phone_number;
  ResendBody(this.phone_number);
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['phone_number'] = phone_number;
    return _data;
  }
}