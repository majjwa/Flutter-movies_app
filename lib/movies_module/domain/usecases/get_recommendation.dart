import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/errors/faluire.dart';
import 'package:movies_app/core/usecases/base_usecase.dart';
import 'package:movies_app/movies_module/domain/entities/recommendation.dart';
import 'package:movies_app/movies_module/domain/repository/base_movie_repository.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>, RecommendationParameters>{
  final BaseMovieRepo baseMovieRepo;
  GetRecommendationUseCase(this.baseMovieRepo);

  @override
  Future<Either<Faluire,List<Recommendation>>> call(RecommendationParameters parameters) async{
  return await baseMovieRepo.getRecommendation(parameters);
  }


}
class RecommendationParameters extends Equatable{
  final int id;

   const RecommendationParameters(this.id);

  @override
  List<Object?> get props => [id];


}