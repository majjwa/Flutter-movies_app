import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/uitiles/enums.dart';
import 'package:movies_app/movies_module/domain/usecases/get_movie_details.dart';
import 'package:movies_app/movies_module/domain/usecases/get_recommendation.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/recommendation.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;
  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              movieRequestState: RequestState.error,
              message: l.message,
            )),
        (r) => emit(state.copyWith(
              movieDetails: r,
              movieRequestState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUseCase(
      RecommendationParameters(event.id),
    );
    result.fold(
        (l) => emit(state.copyWith(
              recommendationState: RequestState.error,
              recommendationmessage: l.message,
            )),
        (r) => emit(state.copyWith(
              recommendation: r,
              recommendationState: RequestState.loaded,
            )));
  }
}
