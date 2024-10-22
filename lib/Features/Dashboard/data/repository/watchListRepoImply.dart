import 'package:watchlist_task/Features/Dashboard/data/datasource/datasource.dart';
import 'package:watchlist_task/Features/Dashboard/data/model/watchlistmodel.dart';
import 'package:watchlist_task/Features/Dashboard/domain/repository/watchListRep.dart';

class WatchListRepImpl implements WatchListrep {
  final WatchListDatasource watchListDatasource;
  WatchListRepImpl({required this.watchListDatasource});
  @override
  Future<List<WatchListModel>> watchListRep() async =>
      await watchListDatasource.fetchdata();
}
