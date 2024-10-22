import 'package:watchlist_task/Features/Dashboard/data/model/watchlistmodel.dart';

abstract interface class WatchListDatasource {
  Future<List<WatchListModel>> fetchdata();
}
