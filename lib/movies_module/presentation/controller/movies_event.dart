import 'package:equatable/equatable.dart';

abstract class MoviesEvents extends Equatable {
  const MoviesEvents();

  @override
  List<Object> get props => [];
}

class GetNowPlayingEvents extends MoviesEvents {}

class GetPopularEvents extends MoviesEvents {}

class GetTopRatedEvents extends MoviesEvents {}
