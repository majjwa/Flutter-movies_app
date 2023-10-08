
import 'package:dartz/dartz.dart';

import '../../../core/errors/faluire.dart';
import '../entities/movies.dart';

abstract class BaseMovieRepo{

  Future<Either<Faluire,List<Movies>>> getNowPlayingMovies();
  Future<Either<Faluire,List<Movies>>> getPopularMovies();
  Future<Either<Faluire,List<Movies>>> getTopRatedMovies();


}