import '../../Helper/SharedHelper.dart';
import '../../UseCase/SharedUseCase.dart';
import '../../Common/UserInfo.dart';

class AuthController
{
  Future<bool> validateUser( UserInfo userInfo)async
  {
    await SharedHelper.initSharedUseCase();
    bool res= await SharedHelper.dIinstance<SharedUseCase>().executeLogin(userInfo);
    if(res)
    {
     return true;
    }
    return false;
  }
  Future<bool> createUser( UserInfo userInfo)async
  {
    await SharedHelper.initSharedUseCase();
    bool res= await SharedHelper.dIinstance<SharedUseCase>().executeRegister(userInfo);
    if(res)
    {
      return true;
    }
    return false;
  }
  Future<bool> authUser( String code,String phone)async
  {
    await SharedHelper.initSharedUseCase();
    bool res= await SharedHelper.dIinstance<SharedUseCase>().authUser(code,phone);
    if(res)
    {
      return true;
    }
    return false;
  }
  Future<bool> resetUserPassword(String phone)async
  {
    await SharedHelper.initSharedUseCase();
    bool res= await SharedHelper.dIinstance<SharedUseCase>().resetUserPassword(phone);
    if(res)
    {
      return true;
    }
    return false;
  }
  Future<bool> resetPassword(String phone,String code,String password)async
  {
    await SharedHelper.initSharedUseCase();
    bool res= await SharedHelper.dIinstance<SharedUseCase>().resetPassword(phone,code,password);
    if(res)
    {
      return true;
    }
    return false;
  }
  resendCode(String phone)async
  {
    await SharedHelper.initSharedUseCase();
    await SharedHelper.dIinstance<SharedUseCase>().resendCode(phone);
  }


}