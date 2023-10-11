import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecases/base_usecase.dart';
import 'package:movies_app/movies_module/domain/repository/base_movie_repository.dart';

import '../../../core/errors/faluire.dart';
import '../entities/movies.dart';

class GetPopularUseCase extends BaseUseCase<List<Movies>,NoParameters> {
  final BaseMovieRepo baseMovieRepo;
  GetPopularUseCase(this.baseMovieRepo);

  @override
  Future<Either<Faluire,List<Movies>>> call(NoParameters parameters) async {
    return await baseMovieRepo.getPopularMovies();
  }
}
