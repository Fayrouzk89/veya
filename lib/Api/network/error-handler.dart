import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../Helper/AppLoading.dart';
import '../apiResponse/FailureResponse.dart';
import 'strings_manager.dart';
import 'faiure.dart';
class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    //LocalDataHelper.isUpdateNowHappen=false;
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioError error) {
   // LocalDataHelper.isUpdateNowHappen=false;
    AppLoading.hideLoading();
    print("My message "+error.message.toString());
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.RECIEVE_TIMEOUT.getFailure();
    // check if the response itself coming with null!!
      case DioErrorType.response:
        if (error.response != null &&
            error.response?.statusCode != null &&
            error.response?.statusMessage != null) {
          if(error.response!=null && error.response!.data!=null )
          {


            FailureResponse failureResponse=FailureResponse.fromJson(json.decode(json.encode(error.response!.data)));
            if(failureResponse!=null && failureResponse.error!=null && failureResponse.error!="") {
              return Failure(error.response?.statusCode ?? 0,
                  failureResponse.error! ?? "");
            }
            else if(failureResponse.error==null || failureResponse.error=="")
            {
              failureResponse.error=error.response!.data.toString();
              return Failure(error.response?.statusCode ?? 0,
                  failureResponse.error! ?? "");
            }

          }
          return Failure(error.response?.statusCode ?? 0,
              error.response?.statusMessage ?? "");
        } else {
          return DataSource.DEFAULT.getFailure();
        }
      case DioErrorType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioErrorType.other:
        return DataSource.DEFAULT.getFailure();
    }
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ResponseCode {
  // remote status code
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int NOT_FOUND = 404; // failure, not found
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static String SUCCESS = AppStrings.success.tr(); // success with data
  static String NO_CONTENT =
  AppStrings.noContent.tr(); // success with no data (no content)
  static String BAD_REQUEST =
  AppStrings.badRequestError.tr(); // failure, API rejected request
  static String UNAUTORISED =
  AppStrings.unauthorizedError.tr(); // failure, user is not authorised
  static String FORBIDDEN =
  AppStrings.forbiddenError.tr(); //  failure, API rejected request
  static String INTERNAL_SERVER_ERROR =
  AppStrings.internalServerError.tr(); // failure, crash in server side
  static String NOT_FOUND =
  AppStrings.notFoundError.tr(); // failure, crash in server side

  // local status code
  static String CONNECT_TIMEOUT = AppStrings.timeoutError.tr();
  static String CANCEL = AppStrings.defaultError.tr();
  static String RECIEVE_TIMEOUT = AppStrings.timeoutError.tr();
  static String SEND_TIMEOUT = AppStrings.timeoutError.tr();
  static String CACHE_ERROR = AppStrings.cacheError.tr();
  static String NO_INTERNET_CONNECTION = "noInternetError".tr();
  static String DEFAULT = AppStrings.defaultError.tr();
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTORISED:
        return Failure(ResponseCode.UNAUTORISED, ResponseMessage.UNAUTORISED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(
            ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}