import 'package:equatable/equatable.dart';
import 'package:watchlist_task/Features/Dashboard/data/model/watchlistmodel.dart';

abstract interface class WatchListState extends Equatable {
  const WatchListState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WatchListLoadingState extends WatchListState {}

class WatchListSuccessState extends WatchListState {
  final List<WatchListModel> watchListDetails;

  const WatchListSuccessState({required this.watchListDetails});
  @override
  // TODO: implement props
  List<Object?> get props => [watchListDetails];
}

class WatchListFailureState extends WatchListState {
  final String message;

  const WatchListFailureState({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
