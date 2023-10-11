 import '../../domain/entities/recommendation.dart';

class RecommendationModel  extends Recommendation{
 const RecommendationModel({
   required super.backdrobPath,
   required super.id, });

 factory RecommendationModel.fromJson(Map<String, dynamic>json)=>RecommendationModel(
     id: json["id"],
     backdrobPath:json["backdrop_path"],

 );
 }
