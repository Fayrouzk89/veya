import 'package:equatable/equatable.dart';




abstract class UserInfoEvent extends Equatable {
  const UserInfoEvent();

  @override
  List<Object> get props => [];
}

class GetUserInfoInitial extends UserInfoEvent {}
class UpdateData extends UserInfoEvent {}