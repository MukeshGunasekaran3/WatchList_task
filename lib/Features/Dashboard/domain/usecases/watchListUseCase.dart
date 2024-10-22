import 'package:watchlist_task/Features/Dashboard/data/model/watchlistmodel.dart';

import '../repository/watchListRep.dart';

class WatchListUseCase {
  final WatchListrep watchlistrep;

  WatchListUseCase({required this.watchlistrep});
  Future<List<WatchListModel>> getdata() async =>
      await watchlistrep.watchListRep();
}
