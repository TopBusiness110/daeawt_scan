
import 'package:daeawt_scan/core/api/app_interceptors.dart';
import 'package:daeawt_scan/core/api/base_api_consumer.dart';
import 'package:daeawt_scan/core/api/dio_consumer.dart';
import 'package:daeawt_scan/core/remote/service_api.dart';
import 'package:daeawt_scan/features/profile/cubit/profile_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/home/cubit/home_cubit.dart';
import 'features/login/cubit/login_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> setUp()async{
  //! Features

  ///////////////////////// Blocs ////////////////////////

  serviceLocator.registerFactory(
        () => LoginCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
        () => HomeCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
        () => ProfileCubit(serviceLocator()),
  );



  ///////////////////////////////////////////////////////////////////////////////

  //! External
  // Shared Preferences
final sharedPreferences = SharedPreferences.getInstance();

serviceLocator.registerLazySingleton(() => sharedPreferences);
serviceLocator.registerLazySingleton(() => ServiceApi(serviceLocator()));
serviceLocator.registerLazySingleton<BaseApiConsumer>(
        () => DioConsumer(client:serviceLocator() )
);
serviceLocator.registerLazySingleton(() => AppInterceptors());
serviceLocator.registerLazySingleton(() => Dio(
  BaseOptions(
    contentType: "application/x-www-form-urlencoded",
    headers: {
      "Accept":"application/json",
      'Content-Type': 'application/x-www-form-urlencoded',
    }
  ),
));
serviceLocator.registerLazySingleton(
      () => LogInterceptor(
    request: true,
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true,
    error: true,
  ),
);

}