import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/uitiles/enums.dart';
import 'package:movies_app/core/usecases/base_usecase.dart';
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
    on<GetNowPlayingEvents>(_getNowPlaying);
    on<GetPopularEvents>(_getPopular);
    on<GetTopRatedEvents>(_getTopRated);
  }

  FutureOr<void> _getNowPlaying(
      GetNowPlayingEvents event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              nowPlayingState: RequestState.error,
              popularMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              nowPlayingMovies: r,
              nowPlayingState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getPopular(
      GetPopularEvents event, Emitter<MoviesState> emit) async {
    final result = await getPopulasUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              popularState: RequestState.error,
              popularMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              popularMovies: r,
              popularState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getTopRated(
      GetTopRatedEvents event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              topRatedState: RequestState.error,
              topRatedMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              topRatedMovies: r,
              topRatedState: RequestState.loaded,
            )));
  }
}
