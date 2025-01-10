import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../Helper/LocalDataHelper.dart';
import 'app_consts.dart';
import 'constants.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServicesClient{
  factory AppServicesClient(Dio dio,String baseUrl)= _AppServicesClient;


  @GET("")
  Future<dynamic> CallDynamic(String url,int type);
  @POST("")
  Future<dynamic> CallPostDynamic(String url,int type,body);



}