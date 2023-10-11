part of 'movie_details_bloc.dart';

 class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieRequestState;
  final String message;
  const MovieDetailsState({
    this.movieDetails,
    this.movieRequestState = RequestState.loading,
    this.message = '',
  });

MovieDetailsState copyWith({

   MovieDetails? movieDetails,
   RequestState? movieRequestState,
   String? message,
 }){
  return MovieDetailsState(
   movieDetails: movieDetails?? this.movieDetails,
    movieRequestState:movieRequestState?? this.movieRequestState,
    message: message?? this.message,
  );
}

  @override
  List<Object?> get props => [
    movieDetails,
    movieRequestState,
    message];

}



