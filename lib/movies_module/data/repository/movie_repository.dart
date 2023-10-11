import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/exeptions.dart';
import 'package:movies_app/core/errors/faluire.dart';
import 'package:movies_app/movies_module/data/remote_data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies_module/domain/entities/movie_details.dart';
import 'package:movies_app/movies_module/domain/entities/movies.dart';
import 'package:movies_app/movies_module/domain/entities/recommendation.dart';
import 'package:movies_app/movies_module/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies_module/domain/usecases/get_movie_details.dart';
import 'package:movies_app/movies_module/domain/usecases/get_recommendation.dart';

class MovieRepository extends BaseMovieRepo{
final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);


  @override
  Future<Either<Faluire,List<Movies>>> getNowPlayingMovies() async{
    final result= await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return (right(result));
    }on ServerException catch(faluire){
      return(left(serverFail(faluire.errorMessageModel.statusMessage)));
    }
  }

  @override
  Future<Either<Faluire,List<Movies>>> getPopularMovies() async{

    final result= await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return (right(result));
    }on ServerException catch(faluire){
      return(left(serverFail(faluire.errorMessageModel.statusMessage)));
    }  }

  @override
  Future<Either<Faluire,List<Movies>>> getTopRatedMovies() async{

    final result= await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return (right(result));
    }on ServerException catch(faluire){
      return(left(serverFail(faluire.errorMessageModel.statusMessage)));
    }  }

  @override
  Future<Either<Faluire, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters) async{
    final result= await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return (right(result));
    }on ServerException catch(faluire){
      return(left(serverFail(faluire.errorMessageModel.statusMessage)));
    }
  }

  @override
  Future<Either<Faluire, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async{
    final result= await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return (right(result));
    }on ServerException catch(faluire){
      return(left(serverFail(faluire.errorMessageModel.statusMessage)));
    }
  }


}