import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/uitiles/enums.dart';
import 'package:movies_app/movies_module/data/remote_data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies_module/data/repository/movie_repository.dart';
import 'package:movies_app/movies_module/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies_module/domain/usecases/get_now_playing.dart';
import 'package:movies_app/movies_module/presentation/controller/movies_event.dart';
import 'package:movies_app/movies_module/presentation/controller/movies_state.dart';

class MovieBloc extends Bloc<MoviesEvents, MoviesState> {
  MovieBloc() : super(const MoviesState()) {
    on<GetNowPlayingEvents>((event, emit) async {
      BaseMovieRemoteDataSource baseMovieRemoteDataSource =
          MovieRemoteDataSource();
      BaseMovieRepo baseMovieRepo = MovieRepository(baseMovieRemoteDataSource);
      final result = await GetNowPlayingUseCase(baseMovieRepo).execute();
      emit(const MoviesState(nowPlayingState: RequestState.loaded));
      result.fold(
          (l) => emit(MoviesState(
                nowPlayingState: RequestState.error,
                nowPlayingMessage: l.message,
              )),
          (r) => emit(MoviesState(
                nowPlayingMovies: r,
                nowPlayingState: RequestState.loaded,
              )));
    });
  }
}
