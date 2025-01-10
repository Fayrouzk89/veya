import 'app_api.dart';
import 'package:dartz/dartz.dart';
abstract class RemoteDataSource{


  Future<dynamic>CallDynamic(String url,int type);
  Future<dynamic>CallPostDynamic(String url,int type,var body);





}

class RemoteDataSourceImp implements RemoteDataSource{

  final AppServicesClient _appServicesClient;
  RemoteDataSourceImp(this._appServicesClient);


  @override
  Future<dynamic> CallDynamic(String url, int type)async {
    // TODO: implement CallDynamic
    return await _appServicesClient.CallDynamic(url,type);
  }

  @override
  Future<dynamic> CallPostDynamic(String url, int type, body)async {
    // TODO: implement CallPostDynamic
    return await _appServicesClient.CallPostDynamic(url,type,body);
  }





}