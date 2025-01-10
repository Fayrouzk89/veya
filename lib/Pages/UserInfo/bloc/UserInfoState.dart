import 'package:equatable/equatable.dart';
import '../../../Api/apiResponse/VeraUser.dart';



abstract class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object?> get props => [];
}

class UserInfoInitial extends UserInfoState {}


class DataLoading extends UserInfoState {}
class DataLoaded extends UserInfoState {}

class UserInfoLoaded extends UserInfoState {
  final VeraUser Model;
  const UserInfoLoaded(this.Model);
}

class UserInfoError extends UserInfoState {
  final String? message;
  const UserInfoError(this.message);
}
