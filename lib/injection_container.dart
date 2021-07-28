import 'package:get_it/get_it.dart';
import 'package:test_bloc/logic/profile/data/datasources/profile_datasource.dart';
import 'package:test_bloc/logic/profile/data/repositories/profile_repository.dart';

import 'logic/profile/bloc/profile_bloc.dart';

final getIt = GetIt.instance;

void setupInjections() {
  getIt.registerLazySingleton<ProfileRemoteDatasource>(
    () => ProfileRemoteDatasourceImpl());

  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(getIt()));

  getIt.registerFactory<ProfileBloc>(
    () => ProfileBloc(getIt()));
}