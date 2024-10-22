import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_task/Features/Dashboard/presentation/blocs/bottom_Navigation_cubit.dart';
import 'package:watchlist_task/Features/Dashboard/presentation/blocs/watchlist_bloc.dart';
import 'package:watchlist_task/Features/Dashboard/presentation/screens/home_screen.dart';
import 'package:watchlist_task/core/theme/theme.dart';
import 'package:watchlist_task/dependencyInjection/init_injection.dart';

void main() async {
  await ServiceLocator.init();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<WatchListBloc>(
        create: (_) => ServiceLocator.serviceLocator<WatchListBloc>()),
    BlocProvider<BottomNavigationCubit>(
      create: (context) =>
          ServiceLocator.serviceLocator<BottomNavigationCubit>(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Watchlist',
      theme: AppTheme.Darkmode(context),
      home: HomeScreen(),
    );
  }
}
