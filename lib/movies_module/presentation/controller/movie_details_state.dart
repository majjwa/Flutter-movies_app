part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {

  const MovieDetailsState({
    this.recommendation = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationmessage = '',
    this.movieDetails,
    this.movieRequestState = RequestState.loading,
    this.message = '',
  });
  final MovieDetails? movieDetails;
  final RequestState movieRequestState;
  final String message;
  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String recommendationmessage;

  MovieDetailsState copyWith({
    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String? recommendationmessage,
    MovieDetails? movieDetails,
    RequestState? movieRequestState,
    String? message,
  }) {
    return MovieDetailsState(
      recommendation: recommendation ?? this.recommendation,
      recommendationmessage:
          recommendationmessage ?? this.recommendationmessage,
      recommendationState: recommendationState ?? this.recommendationState,
       movieDetails: movieDetails ?? this.movieDetails,
      movieRequestState: movieRequestState ?? this.movieRequestState,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        recommendation,
        recommendationState,
        recommendationmessage,
        movieDetails,
        movieRequestState,
        message
      ];
}
