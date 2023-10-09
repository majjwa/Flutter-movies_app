import 'package:equatable/equatable.dart';
import 'package:movies_app/core/uitiles/enums.dart';
import '../../domain/entities/movies.dart';

// we add all the states of the screens(the scenarios)

class MoviesState extends Equatable {
  final List<Movies> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
  });

  @override
  List<Object?> get props => [nowPlayingMovies, nowPlayingState,nowPlayingMessage];
}
