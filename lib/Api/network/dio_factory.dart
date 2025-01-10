import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:veya_club/Helper/LocalDataHelper.dart';
import 'app_consts.dart';
import 'constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';



class DioFactory {



  DioFactory();




  Future<Dio> getDio() async {

    final Map<String, dynamic> _headers = {
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
      'Accept': "application/json; charset=utf-8",
      'Content-Type': 'application/json; charset=UTF-8',
      //"authorization": getAuth()
    };

    Dio dio = Dio();
    dio.options = BaseOptions(
      headers: _headers,
      receiveTimeout: Constants.apiTimeOut,
      sendTimeout: Constants.apiTimeOut,
      baseUrl: Constants.baseUrl,
    );

    if(!kReleaseMode){
      dio.interceptors.add(PrettyDioLogger(
        requestHeader : true,
        requestBody : true,
        responseHeader : true,));
    }
    return dio;
  }
}