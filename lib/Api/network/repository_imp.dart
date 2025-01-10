import 'package:dartz/dartz.dart';
import 'error-handler.dart';
import 'faiure.dart';
import 'network_info.dart';
import 'remote_data_source.dart';
import 'repository.dart';


class RepositoryImp implements Repository{
  late final RemoteDataSource _remoteDataSource;
  late final NetworkInfo _networkInfo;



  RepositoryImp(this._remoteDataSource, this._networkInfo);






  @override
  Future<Either<Failure, dynamic>> CallDynamic(String url, int type)async {
    // TODO: implement CallDynamic
    if(await _networkInfo.isConnected){
      try{
        final dynamic response = await _remoteDataSource.CallDynamic(url,type);
        if(response!=null) {
          return Right(response);
        } else {
          return Left(Failure(ApiInternalStatus.FAILURE,ResponseMessage.DEFAULT));
        }

      }catch (error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }else{
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, dynamic>> CallPostDynamic(String url, int type, body)async {
    // TODO: implement CallPostDynamic
    if(await _networkInfo.isConnected){
      try{
        final dynamic response = await _remoteDataSource.CallPostDynamic(url,type,body);
        if(response!=null) {
          return Right(response);
        } else {
          return Left(Failure(ApiInternalStatus.FAILURE,ResponseMessage.DEFAULT));
        }

      }catch (error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }else{
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }





}