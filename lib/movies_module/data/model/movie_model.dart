import 'package:movies_app/movies_module/domain/entities/movies.dart';

class MovieModel extends Movies{
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genderId,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });
factory MovieModel.fromJson(Map<String, dynamic>json)=>MovieModel(
    id: json["id"],
    title: json["title"],
    backdropPath: json["backdrop_path"],
    // that is because gender id is list
    genderId:List<int>.from(json["gener_id"].map((e) => e)),
    overview:json["overview"] ,
    voteAverage: json["vote_average"],
    releaseDate: json["release_date"],
);


}