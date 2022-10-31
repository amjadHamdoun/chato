import 'dart:convert';
import 'dart:io';
import 'package:chato/core/utils/constants.dart';
import 'package:chato/feature/Conversation/model/report_model.dart';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import '../../../../Globals.dart';


abstract class ReportDataSource {
  Future<Either<String, ReportModel>>
  report({
  required int id,
    required String des,
    required String photo
  });
}

class ReportDataSourceImpl extends
ReportDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  ReportDataSourceImpl(
      { required this.dio,
        required this.networkInfo
      });

  @override
  Future<Either<String, ReportModel>>
  report({
    required int id,
    required String des,
    required String photo
  }) async {
    if (await networkInfo.hasConnection) {
      try {
        dio.options.headers["Authorization"] ="Bearer ${Global.userToken}";
        final re = await dio.post
          (
          Endpoints.report,
          data: {
            'user2_id':id,
            'note':des,
            'photo':photo,
          },
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );
        return  Right(ReportModel.fromJson(json.decode(re.data)));
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
