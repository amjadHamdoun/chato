// import 'dart:convert';
// import 'package:chato/feature/Pages/ProfilePage/model/friend_ship_model.dart';
// import 'package:dartz/dartz.dart';
// import 'package:data_connection_checker_tv/data_connection_checker.dart';
// import 'package:dio/dio.dart';
//
// import '../../../../Globals.dart';
// import '../../../../core/utils/constants.dart';
//
//
//
//
//
//
//
// abstract class FriendShipRemoteDataSource {
//   Future<Either<String, FriendShipModel>> friendShip(
//       );
//
// }
//
// class FriendShipRemoteDataSourceImpl extends FriendShipRemoteDataSource {
//   final Dio dio;
//   final DataConnectionChecker networkInfo;
//   FriendShipRemoteDataSourceImpl({ required this.dio, required this.networkInfo});
//
//   @override
//   Future<Either<String, FriendShipModel>> friendShip(
//       ) async {
//     if (await networkInfo.hasConnection) {
//       try {
//          dio.options.headers["authorization"] = "token ${Global.userToken}";
//         final re = await dio.get(
//           Endpoints.friendShipRequests,
//           options: Options(
//             followRedirects: false,
//             validateStatus: (status) {
//               return status! < 500;
//             },
//           ),
//         );
//         print("re");
//         print(re);
//         print("re");
//         FriendShipModel friendShipModel=FriendShipModel.fromJson(json.decode(re.data));
//         print(friendShipModel.message);
//         return Right(FriendShipModel.fromJson(json.decode(re.data)));
//       } on DioError catch (ex) {
//         if (ex.type == DioErrorType.connectTimeout) {
//           return Left(Er.networkError);
//         }
//         else if (ex.type == DioErrorType.receiveTimeout) {
//           return Left(Er.networkError);
//         }
//         return Left(Er.networkError);
//       } catch (e) {
//         return Left(Er.error);
//       }
//     }
//     else {
//       return Left(Er.networkError);
//     }
//
//
//
//
//
//   }
//
//
//
//
// }
