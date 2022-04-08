
import 'package:chato/feature/Pages/StorePage/bloc/store_bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'core/utils/constants.dart';
import 'feature/Conversation/bloc/conversation_bloc.dart';
import 'feature/Pages/RoomPage/bloc/room_bloc.dart';
import 'feature/RoomConversation/bloc/room_conversation_bloc.dart';
import 'feature/pages/HomePage/bloc/home_bloc.dart';



final sl = GetIt.instance;

///
/// The [init] function is responsible for adding the instances to the graph
///
Future<void> init() async {
  //! External


  /// Adding the [Dio] instance to the graph to be later used by the local data sources
  sl.registerLazySingleton(
    () {
      final dio = Dio(
        BaseOptions(
          connectTimeout: 20000,
          receiveTimeout: 20000,
          sendTimeout: 20000,
          baseUrl: Endpoints.BASE_URL,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          responseType: ResponseType.plain,
        ),
      );
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          responseHeader: true,
          requestHeader: true,
          request: true,
        ),
      );

      return dio;
    },
  );

  sl.registerLazySingleton(() => DataConnectionChecker());


  // Bloc
  sl.registerLazySingleton(() => HomeBloc(
  ));
  sl.registerLazySingleton(() => ConversationBloc(
  ));
  sl.registerLazySingleton(() => StoreBloc(
  ));
  sl.registerLazySingleton(() => RoomConversationBloc(
  ));



}
