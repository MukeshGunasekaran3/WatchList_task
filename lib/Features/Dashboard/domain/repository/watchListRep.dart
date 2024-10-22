import 'package:watchlist_task/Features/Dashboard/data/model/watchlistmodel.dart';

abstract interface class WatchListrep {
  Future<List<WatchListModel>> watchListRep();
}
