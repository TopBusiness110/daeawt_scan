import 'package:daeawt_scan/core/api/base_api_consumer.dart';
import 'package:dartz/dartz.dart';

import '../../features/login/model/login_model.dart';
import '../api/end_points.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';
import '../models/user_model.dart';

class ServiceApi{

  final BaseApiConsumer dio ;
   ServiceApi(this.dio);
  Future<Either<Failure, UserDataModel>> postLogin(LoginModel model) async {
    try {
      final response = await dio.post(
        EndPoints.loginUrl,
        body: {
          'email': model.email,
          'password': model.password,
        },
      );
      return Right(UserDataModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}