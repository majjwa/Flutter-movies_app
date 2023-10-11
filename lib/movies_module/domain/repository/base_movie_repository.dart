
import 'package:dartz/dartz.dart';
import 'package:movies_app/movies_module/domain/entities/movie_details.dart';
import 'package:movies_app/movies_module/domain/entities/recommendation.dart';
import 'package:movies_app/movies_module/domain/usecases/get_movie_details.dart';
import 'package:movies_app/movies_module/domain/usecases/get_recommendation.dart';
import '../../../core/errors/faluire.dart';
import '../entities/movies.dart';

abstract class BaseMovieRepo{

  Future<Either<Faluire,List<Movies>>> getNowPlayingMovies();
  Future<Either<Faluire,List<Movies>>> getPopularMovies();
  Future<Either<Faluire,List<Movies>>> getTopRatedMovies();
  Future<Either<Faluire,MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Faluire,List<Recommendation>>> getRecommendation(RecommendationParameters parameters);


}