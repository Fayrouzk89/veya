import 'package:bloc/bloc.dart';
import '../../../Api/apiResponse/VeraUser.dart';
import '../../../Helper/DashBoardHelper.dart';
import 'UserInfoEvent.dart';
import 'UserInfoState.dart';
class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {


  UserInfoBloc() : super(UserInfoInitial()) {

    on<GetUserInfoInitial>((event, emit) async {
      try {
        emit(DataLoading());
        VeraUser? user=await  DashBoardHelper.getUser();
        if(user!=null)
          {
        emit(UserInfoLoaded(user!));
          }
        else
          {
            emit(UserInfoError("Failed to get user data"));
          }

      }  catch(l) {
        emit(UserInfoError("Failed to fetch user data"));
      }
    });}


}