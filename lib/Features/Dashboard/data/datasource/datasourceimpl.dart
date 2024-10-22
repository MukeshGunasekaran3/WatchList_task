import 'package:watchlist_task/Features/Dashboard/data/datasource/datasource.dart';
import 'package:watchlist_task/Features/Dashboard/data/model/watchlistmodel.dart';

class WatchListDataSourceimpl implements WatchListDatasource {
  @override
  Future<List<WatchListModel>> fetchdata() async {
    List<WatchListModel> watchListDetails = [
      WatchListModel(
          symbol: 'GOLD 26JUL 59500 CE',
          exchange: 'MCX',
          price: 298.50,
          change: 23.50,
          percentageChange: 8.54),
      WatchListModel(
          symbol: 'ACCELYA',
          exchange: 'NSE',
          price: 1337.70,
          change: 1.05,
          percentageChange: 0.07),
      WatchListModel(
          symbol: 'ACC',
          exchange: 'BSE',
          price: 1795.20,
          change: 27.20,
          percentageChange: 1.53),
      WatchListModel(
          symbol: 'ACC',
          exchange: 'NSE',
          price: 1792.30,
          change: 25.40,
          percentageChange: 1.43),
    ];
    return await Future.delayed(
        const Duration(seconds: 1), () => watchListDetails);
  }
}
