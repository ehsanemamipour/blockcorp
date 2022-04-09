import 'package:blockcorp/core/services/http_service.dart';
import 'package:blockcorp/core/utils/network_utils.dart';
import 'package:blockcorp/features/countries/data/datasource/countries_remote_datasource.dart';
import 'package:blockcorp/features/countries/data/repositories/countries_repository_impl.dart';
import 'package:blockcorp/features/countries/domain/repositories/countries_repository.dart';
import 'package:blockcorp/features/countries/domain/usecases/fetch_countries.dart';
import 'package:blockcorp/features/countries/presentation/controllers/countries/countries_controller.dart';
import 'package:blockcorp/features/countries/presentation/controllers/countries/home_controller.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shitty_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  _injectExternalLibraries();
  _injectSystemStatus();
  _injectCountries();
}

void _injectCountries() {
  //controller
  sl.registerFactory(() => CountriesController(sl()));
  sl.registerFactory(() => HomeController());
  //usecase
  sl.registerLazySingleton(() => FetchCountries(repository: sl()));

  //repositories
  sl.registerLazySingleton<CountriesRepository>(
      () => CountriesRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));
  //datasources
  sl.registerLazySingleton<CountriesRemoteDataSource>(
      () => CountriesRemoteDataSourceImpl(httpService: sl()));
}

void _injectExternalLibraries() {
  sl.registerLazySingleton<HTTPService>(
    () => DioService(
      dio: Dio(),
    ),
  );
  //Data Connection Checker
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

void _injectSystemStatus() {
  // system Statuses
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(dataConnectionChecker: sl()));
}
