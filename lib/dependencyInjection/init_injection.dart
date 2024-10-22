import 'package:get_it/get_it.dart';
import 'package:watchlist_task/Features/Dashboard/data/datasource/datasource.dart';
import 'package:watchlist_task/Features/Dashboard/data/repository/watchListRepoImply.dart';
import 'package:watchlist_task/Features/Dashboard/domain/repository/watchListRep.dart';
import 'package:watchlist_task/Features/Dashboard/domain/usecases/watchListUseCase.dart';
import 'package:watchlist_task/Features/Dashboard/presentation/blocs/bottom_Navigation_cubit.dart';
import 'package:watchlist_task/Features/Dashboard/presentation/blocs/watchlist_bloc.dart';

import '../Features/Dashboard/data/datasource/datasourceimpl.dart';

class ServiceLocator {
  static final GetIt serviceLocator = GetIt.instance;
  static Future<void> init() async {
    serviceLocator.registerLazySingleton<WatchListDatasource>(
      () => WatchListDataSourceimpl(),
    );
    serviceLocator.registerLazySingleton<WatchListrep>(
      () => WatchListRepImpl(watchListDatasource: serviceLocator.call()),
    );
    serviceLocator.registerLazySingleton<WatchListUseCase>(
      () => WatchListUseCase(watchlistrep: serviceLocator.call()),
    );
    serviceLocator.registerFactory<WatchListBloc>(
      () => WatchListBloc(watchListUseCase: serviceLocator.call()),
    );
    serviceLocator.registerFactory<BottomNavigationCubit>(
      () => BottomNavigationCubit(),
    );
  }
}
