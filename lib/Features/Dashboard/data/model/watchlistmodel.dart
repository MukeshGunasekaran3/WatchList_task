class WatchListModel {
  final String symbol;
  final String exchange;
  final double price;
  final double change;
  final double percentageChange;

  WatchListModel({
    required this.symbol,
    required this.exchange,
    required this.price,
    required this.change,
    required this.percentageChange,
  });
}
