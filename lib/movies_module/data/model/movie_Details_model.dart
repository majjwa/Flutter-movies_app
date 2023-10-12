 import 'package:movies_app/movies_module/data/model/generes_model.dart';
import 'package:movies_app/movies_module/domain/entities/movie_details.dart';

class MovieDetailsModel  extends MovieDetails{
  const MovieDetailsModel({
    required super.generes,
     super.backDropPath,
    required super.id,
    required super.overView,
    required super.realeaseDate,
    required super.title,
    required super.runTime,
    required super.voteAverage,
  });
  factory MovieDetailsModel.fromJson(Map<String, dynamic>json)=>MovieDetailsModel(
      generes: List<GeneresModel>.from(json["genres"].map((x)=>GeneresModel.fromJson(x))),
      backDropPath: json["backdrop_path"],
      id: json["id"],
       overView:json["overview"] ,
      realeaseDate:  json["release_date"],
      title: json["title"],
      runTime: json["runtime"],
      voteAverage:json["vote_average"].toDouble(),

  );

}