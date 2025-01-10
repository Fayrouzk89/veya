import 'package:dartz/dartz.dart';

import 'faiure.dart';


abstract class Repository{

  Future<Either<Failure,dynamic>>CallDynamic(String url,int type);
  Future<Either<Failure,dynamic>>CallPostDynamic(String url,int type,var body);

}