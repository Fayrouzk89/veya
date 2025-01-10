
import 'package:veya_club/Api/apiResponse/VeraUser.dart';
import 'package:veya_club/UseCase/SharedUseCase.dart';


import 'SharedHelper.dart';

class DashBoardHelper
{
  static  Future<VeraUser?>getUser()async
  {
    await SharedHelper.initSharedUseCase();
    VeraUser? user= await SharedHelper.dIinstance<SharedUseCase>().executeGetUserInfo();
    return user;
  }

}