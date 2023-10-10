import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/uitiles/enums.dart';
import 'package:movies_app/movies_module/domain/usecases/get_now_playing.dart';
import 'package:movies_app/movies_module/domain/usecases/get_popular.dart';
import 'package:movies_app/movies_module/presentation/controller/movies_event.dart';
import 'package:movies_app/movies_module/presentation/controller/movies_state.dart';

import '../../domain/usecases/get_top_rated.dart';

class MovieBloc extends Bloc<MoviesEvents, MoviesState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularUseCase getPopulasUseCase;
  final GetTopRatedUseCase getTopRatedUseCase;
  MovieBloc(this.getNowPlayingUseCase, this.getPopulasUseCase,
      this.getTopRatedUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingEvents>((event, emit) async {
      final result = await getNowPlayingUseCase.execute();
      result.fold(
          (l) => emit(state.copyWith(
                nowPlayingState: RequestState.error,
                popularMessage: l.message,
              )),
          (r) => emit(state.copyWith(
                nowPlayingMovies: r,
                nowPlayingState: RequestState.loaded,
              )));
    });
    on<GetPopularEvents>((event, emit) async {
      final result = await getPopulasUseCase.execute();
      result.fold(
          (l) => emit(state.copyWith(
                popularState: RequestState.error,
                popularMessage: l.message,
              )),
          (r) => emit(state.copyWith(
                popularMovies: r,
                popularState: RequestState.loaded,
              )));
    });
    on<GetTopRatedEvents>((event, emit) async {
      final result = await getTopRatedUseCase.execute();
      result.fold(
          (l) => emit(state.copyWith(
                topRatedState: RequestState.error,
                topRatedMessage: l.message,
              )),
          (r) => emit(state.copyWith(
                topRatedMovies: r,
                topRatedState: RequestState.loaded,
              )));
    });
  }
}
