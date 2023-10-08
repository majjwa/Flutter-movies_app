import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/exeptions.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/uitiles/constants.dart';
import 'package:movies_app/movies_module/data/model/movie_model.dart';

abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
        '${AppConstant.baseUrl}${AppConstant.nowPlaying}api_key=${AppConstant.apiKey}&language=en-US&page=1');
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(
        '${AppConstant.baseUrl}${AppConstant.popular}api_key=${AppConstant.apiKey}&language=en-US&page=1');
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(
        '${AppConstant.baseUrl}${AppConstant.topRated}api_key=${AppConstant.apiKey}&language=en-US&page=1');
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }


}
