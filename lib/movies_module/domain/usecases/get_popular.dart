import 'package:dartz/dartz.dart';
import 'package:movies_app/movies_module/domain/repository/base_movie_repository.dart';

import '../../../core/errors/faluire.dart';
import '../entities/movies.dart';

class GetPopularUseCase {
  final BaseMovieRepo baseMovieRepo;
  GetPopularUseCase(this.baseMovieRepo);

  Future<Either<Faluire,List<Movies>>> execute() async {
    return await baseMovieRepo.getPopularMovies();
  }
}
