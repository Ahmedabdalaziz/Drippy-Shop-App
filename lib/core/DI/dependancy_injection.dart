import 'package:dio/dio.dart' show Dio;
import 'package:drippydrop_app/core/networking/api_service.dart';
import 'package:drippydrop_app/core/networking/dio.dart';
import 'package:drippydrop_app/feature/login/data/repo/login_repo.dart';
import 'package:drippydrop_app/feature/login/logic/login_cubit.dart';
import 'package:drippydrop_app/feature/signup/data/repo/signup_repo.dart';
import 'package:drippydrop_app/feature/signup/logic/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<GetIt> setUpGetIt() async {
  // Register Dio
  getIt.registerSingleton<Dio>(DioFactory.getDio());

  // Register ApiService
  getIt.registerSingleton<ApiService>(ApiService(getIt<Dio>()));

  /////////////////////////////////////////////////////////////////////

  //Register LoginRepository
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository());

  //Register LoginCubit
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepository>()));

  /////////////////////////////////////////////////////////////////////

  // Register SignupRepository
  getIt.registerLazySingleton<SignupRepository>(() => SignupRepository());

  // Register SignupCubit
  getIt.registerLazySingleton<SignupCubit>(
    () => SignupCubit(getIt<SignupRepository>()),
  );

  /////////////////////////////////////////////////////////////////////

  return getIt;
}
