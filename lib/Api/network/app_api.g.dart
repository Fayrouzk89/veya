// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_api.dart';


// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps




class _AppServicesClient implements AppServicesClient {
  _AppServicesClient(this._dio, this.baseUrl) {
   // baseUrl = 'http://ahmedabdelalem38.mocklab.io';
  }

  final Dio _dio;

  String? baseUrl;
 String getBaseUrl(String link)
  {
    String result=   AppConsts.baseUrl  +"/"+link;
    return result;
  }


  Map<String, dynamic> getsecureHeaders()
  {
    return <String, dynamic>{
      'Accept': "application/json; charset=utf-8",
      'X-Requested-With': 'XMLHttpRequest',
      'Content-Type': 'application/json; charset=UTF-8',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS",
      "authorization": getAuth()
    };
  }
  static String getAuth()
  {
    String basicAuth ="";
    if(LocalDataHelper.userInfo!=null)
    {
      String token =LocalDataHelper.userInfo!.access!;
      basicAuth=  'bearer ' +token; //base64.encode(utf8.encode('$username:$password'));
    }
    return basicAuth;
  }





  @override
  Future<dynamic> CallDynamic(String url, int type)async {
    // TODO: implement CallDynamic
    // TODO: implement CallCalander
    const _extra = <String, dynamic>{};


    final _result =await _dio.get(
      getBaseUrl(url),
      options: Options(responseType: ResponseType.json,extra: _extra,headers: getsecureHeaders()), // Set the response type to `stream`.
    );
   // final value = ApiResponse<dynamic>.fromJson(_result.data!,AppConsts.typeCloseSession);
    //return value;
    return _result.data!;
  }

  @override
  Future<dynamic> CallPostDynamic(String url, int type, input)async {
    // TODO: implement CallPostDynamic
    const _extra = <String, dynamic>{};
    final _result =await _dio.post(
      getBaseUrl(url),
      data: input.toJson(),
      options: Options(responseType: ResponseType.json,extra: _extra,headers: getsecureHeaders()), // Set the response type to `stream`.
    );

    return _result.data!;
  }

}