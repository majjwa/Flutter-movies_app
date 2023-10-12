import 'package:movies_app/movies_module/domain/entities/geners.dart';

class GeneresModel extends Generes {
  const GeneresModel({
     super.name,
    required super.id});
  factory GeneresModel.fromJson(Map<String , dynamic>json)=> GeneresModel(
      name: json["name"],
      id: json["id"],
  );
}
