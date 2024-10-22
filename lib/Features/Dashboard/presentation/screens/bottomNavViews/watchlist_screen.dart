import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:watchlist_task/Features/Dashboard/domain/usecases/watchListUseCase.dart';
import 'package:watchlist_task/Features/Dashboard/presentation/blocs/watchlist_bloc.dart';
import 'package:watchlist_task/Features/Dashboard/presentation/blocs/watchlist_event.dart';
import 'package:watchlist_task/Features/Dashboard/presentation/blocs/watchlist_state.dart';
import 'package:watchlist_task/Features/Dashboard/presentation/screens/bottomNavViews/searchScreen.dart';
import 'package:watchlist_task/Features/Dashboard/presentation/widgets/custom_ListTile.dart';
import 'package:watchlist_task/core/theme/color_palete.dart';

class WatchlistScreen extends StatefulWidget {
  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    super.initState();

    // TODO: implement initState
    controller = TabController(length: 3, vsync: this);
    context.read<WatchListBloc>().add(LoadWatchlist());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListBloc, WatchListState>(
      builder: (context, state) {
        print(state);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Watchlist',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            actions: [
              Transform.rotate(
                  angle: -12, child: const Icon(Icons.push_pin_outlined)),
              const SizedBox(
                width: 5,
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size(
                  double.maxFinite, MediaQuery.of(context).size.height * 0.05),
              child: Row(
                children: [
                  Expanded(
                    flex: 80,
                    child: TabBar(
                      controller: controller,
                      tabs: const [
                        Tab(text: 'NIFTY'),
                        Tab(text: 'BANKNIFTY'),
                        Tab(text: 'SENSEX'),
                      ],
                    ),
                  ),
                  const Expanded(
                      flex: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            size: 25,
                            Icons.list_sharp,
                            color: ColorPallete.dark_secondaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
          body: TabBarView(
            controller: controller,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Search & Add',
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                size: 18,
                                Icons.grid_view_sharp,
                                color: ColorPallete.dark_secondaryColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                size: 18,
                                Icons.settings_input_composite_rounded,
                                color: ColorPallete.dark_secondaryColor,
                              ),
                              SizedBox(
                                width: 15,
                              )
                            ],
                          )),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<WatchListBloc, WatchListState>(
                      builder: (context, state) {
                        if (state is WatchListLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is WatchListSuccessState) {
                          return ListView(
                            children: [
                              ...state.watchListDetails.map((item) =>
                                  CustomListTile(
                                      symbol: item.symbol,
                                      exchange: item.exchange,
                                      price: item.price,
                                      change: item.change,
                                      percentageChange: item.percentageChange)),
                              const SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: Text(
                                  "${state.watchListDetails.length}/50 stocks",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          ColorPallete.dark_Secondary_bgColor),
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.width * 0.33,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Icon(
                                        Icons.edit_square,
                                        color: ColorPallete.dark_secondaryColor,
                                        size: 15,
                                      ),
                                      Text(
                                        "Edit Watchlist",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        } else {
                          return const Center(
                              child: Text('Error loading watchlist'));
                        }
                      },
                    ),
                  ),
                  const SizedBox()
                ],
              ),
              const Center(
                child: Text("No data"),
              ),
              const Center(
                child: Text("No data"),
              )
            ],
          ),
        );
      },
    );
  }
}
