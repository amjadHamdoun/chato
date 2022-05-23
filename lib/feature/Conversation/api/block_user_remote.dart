import 'dart:convert';
import 'package:chato/core/utils/constants.dart';
import 'package:chato/feature/Pages/ProfilePage/model/countFriend/count_friend_model.dart';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';

import '../../../../Globals.dart';




abstract class BlockUserRemoteDataSource {
  Future<Either<String, String>> blockUser({
 required int blockedId
  });
}

class BlockUserRemoteDataSourceImpl extends BlockUserRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  BlockUserRemoteDataSourceImpl(
      { required this.dio, required this.networkInfo});

  @override
  Future<Either<String, String>> blockUser({
    required  int blockedId
  }) async {
    if (await networkInfo.hasConnection) {
      try {
        dio.options.headers["Authorization"]
        = "Bearer ${Global.userToken}";
        final re = await dio.post
          (
          Endpoints.blockUser,
          data: { "blocked_id":blockedId },
         );
       if(re.statusCode!>=200||re.statusCode!<=300)
        {
          return const Right('true');
        }
       else{
         return const Right('false');
       }
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
