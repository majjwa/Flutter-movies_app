import 'package:equatable/equatable.dart';

import 'geners.dart';

class MovieDetails extends Equatable {
  final String backDropPath;
  final int id;
  final List<Generes> generes;
  final String overView;
  final String realeaseDate;
  final String title;
  final int runTime;
  final String voteAverage;

  const MovieDetails(
      {required this.generes,
      required this.backDropPath,
      required this.id,
      required this.overView,
      required this.realeaseDate,
      required this.title,
      required this.runTime,
      required this.voteAverage});

  @override
  // TODO: implement props
  List<Object?> get props => [
        generes,
        backDropPath,
        id,
        overView,
        realeaseDate,
        title,
        runTime,
        voteAverage
      ];
}
