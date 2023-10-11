import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/errors/faluire.dart';
import 'package:movies_app/core/usecases/base_usecase.dart';
import 'package:movies_app/movies_module/domain/entities/movie_details.dart';

import '../repository/base_movie_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMovieRepo baseMovieRepo;
  GetMovieDetailsUseCase(this.baseMovieRepo);
  @override
  Future<Either<Faluire, MovieDetails>> call(
      MovieDetailsParameters parameters) async {
    return await baseMovieRepo.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}
