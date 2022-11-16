import 'dart:convert';

import 'package:chato/core/utils/constants.dart';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import '../../../../Globals.dart';
import '../model/verifyEmail/verify_email_model.dart';




abstract class VerifyEmailRemoteDataSource {
  Future<Either<String, VerifyEmailModel>> verifyEmail({
  required int code,
    required String email
});
}

class VerifyEmailRemoteDataSourceImpl extends VerifyEmailRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  VerifyEmailRemoteDataSourceImpl(
      { required this.dio, required this.networkInfo});

  @override
  Future<Either<String, VerifyEmailModel>> verifyEmail({
  required int code,
    required String email
}) async {
    if (await networkInfo.hasConnection) {
      try {
        dio.options.headers["Authorization"]
        = "Bearer ${Global.userToken}";
        final re = await dio.post
          (
          Endpoints.verifyEmail,
          data: {
            'code':code,
            'email':email
          }

        );
        return  Right(VerifyEmailModel.fromJson(json.decode(re.data)));
      } on DioError catch (ex) {
        if (ex.type == DioErrorType.connectTimeout) {
          return Left(Er.networkError);
        }
        else if (ex.type == DioErrorType.receiveTimeout) {
          return Left(Er.networkError);
        }
        return Left(Er.networkError);
      } catch (e) {
        return Left(Er.error);
      }
    }
    else {
      return Left(Er.networkError);
    }
  }


}
