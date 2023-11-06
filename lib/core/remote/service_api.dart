import 'package:daeawt_scan/core/api/base_api_consumer.dart';
import 'package:daeawt_scan/core/models/status_resspons.dart';
import 'package:daeawt_scan/core/preferences/preferences.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../features/contact_us/presentation/contact_model.dart';
import '../../features/login/model/login_model.dart';
import '../api/end_points.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';
import '../models/contact_us_model.dart';
import '../models/setting.dart';
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
  Future<Either<Failure, StatusResponse>> ScanIvitation(String  inviteeId) async {
    try {
      print(";;;;");
     // print(invitationModel.step);
      SingleUserDataModel loginModel = await Preferences.instance.getUserModel();

      final response = await dio.post(
        options: Options(
          headers: {'Authorization': loginModel.userModel!.accessToken!},
        ),
        EndPoints.scanUrl,
        body: {
          'invitation_id':loginModel.invitationModel!.id,
          'invitee_id':inviteeId
        },
      );
      return Right(StatusResponse.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  Future<Either<Failure, SettingDataModel>> getSetting(
      ) async {
    String lan = await Preferences.instance.getSavedLang();
    //  UserModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.settingurl ,


      );
      print(response);
      return Right(SettingDataModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  postContactUs(ContactModel contactModel) async {
    try{
      final response = await dio.post(EndPoints.contactUsUrl,
          body: {
            "name":contactModel.userName,
            "phone":contactModel.phoneNumber,
            "subject":contactModel.topic,
            "message":contactModel.message,
          }
      );
      return Right(ContactUsModel.fromJson(response));
    }on ServerException{
      return Left(ServerFailure());
    }
  }

}