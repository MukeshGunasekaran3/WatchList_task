import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_task/Features/Dashboard/domain/usecases/watchListUseCase.dart';
import 'package:watchlist_task/Features/Dashboard/presentation/blocs/watchlist_event.dart';
import 'package:watchlist_task/Features/Dashboard/presentation/blocs/watchlist_state.dart';

class WatchListBloc extends Bloc<WatchlistEvent, WatchListState> {
  final WatchListUseCase watchListUseCase;
  WatchListBloc({required this.watchListUseCase})
      : super(WatchListLoadingState()) {
    on<LoadWatchlist>(
      (event, emit) async {
        emit(WatchListLoadingState());
        try {
          print("etered");
          final watchListDetails = await watchListUseCase.getdata();
          print(watchListDetails);
          emit(WatchListSuccessState(watchListDetails: watchListDetails));
        } catch (e) {
          print(e.toString());
          emit(const WatchListFailureState(message: "ApiFailed"));
        }
      },
    );
  }
  @override
  void onChange(Change<WatchListState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change.currentState.toString());
  }
}
