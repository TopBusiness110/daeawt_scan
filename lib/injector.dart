
import 'package:daeawt_scan/core/api/app_interceptors.dart';
import 'package:daeawt_scan/core/api/base_api_consumer.dart';
import 'package:daeawt_scan/core/api/dio_consumer.dart';
import 'package:daeawt_scan/core/remote/service_api.dart';
import 'package:daeawt_scan/features/messages/presentation/cubit/messages_cubit.dart';
import 'package:daeawt_scan/features/profile/cubit/profile_cubit.dart';
import 'package:daeawt_scan/features/scan/cubit/scan_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/apology/cubit/appology_cubit.dart';
import 'features/confirmed/cubit/confirmed_cubit.dart';
import 'features/contact_us/presentation/cubit/contact_us_cubit.dart';
import 'features/failed/presentation/cubit/faild_cubit.dart';
import 'features/home/cubit/home_cubit.dart';
import 'features/invited/presentation/cubit/invited_cubit.dart';
import 'features/login/cubit/login_cubit.dart';
import 'features/not_sent/cubit/notsent_cubit.dart';
import 'features/scanned/presentation/cubit/scanned_cubit.dart';
import 'features/waiting/cubit/waiting_cubit.dart';

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
        () => ContactUsCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
        () => ProfileCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
        () => MessagesCubit(),
  );
  serviceLocator.registerFactory(
        () => InvitedCubit(),
  );
  serviceLocator.registerFactory(
        () => WaitingCubit(),
  );
  serviceLocator.registerFactory(
        () => FaildCubit(),
  );
  serviceLocator.registerFactory(
        () => ScannedCubit(),
  );
  serviceLocator.registerFactory(
        () => ConfirmedCubit(),
  );
  serviceLocator.registerFactory(
        () => AppologyCubit(),
  );
  serviceLocator.registerFactory(
        () => NotsentCubit(),
  );
  serviceLocator.registerFactory(
        () => ScanCubit(serviceLocator()),
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