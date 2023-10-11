
import 'package:get_it/get_it.dart';
import 'package:movies_app/movies_module/data/remote_data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies_module/data/repository/movie_repository.dart';
import 'package:movies_app/movies_module/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies_module/domain/usecases/get_movie_details.dart';
import 'package:movies_app/movies_module/domain/usecases/get_now_playing.dart';
import 'package:movies_app/movies_module/domain/usecases/get_popular.dart';
import 'package:movies_app/movies_module/domain/usecases/get_top_rated.dart';
import 'package:movies_app/movies_module/presentation/controller/movie_details_bloc.dart';
import 'package:movies_app/movies_module/presentation/controller/movies_bloc.dart';

final sl =GetIt.instance;
class ServiceLocator{
  void init(){
    // make the object reload again
    sl.registerFactory(() => MovieBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl()));
    // make the object load one time
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedUseCase(sl()));
    sl.registerLazySingleton<BaseMovieRepo>(() => MovieRepository(sl()));
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));

}}