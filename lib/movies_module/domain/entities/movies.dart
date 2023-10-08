import 'package:equatable/equatable.dart';

class Movies extends Equatable{
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genderId;
  final String overview;
  final double voteAverage;
  final int releaseDate;

  const Movies({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genderId,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,

  });

  @override
  List<Object> get props =>[
   id,
   title,
   backdropPath,
   genderId,
   overview,
   voteAverage,
   releaseDate,
  ];
}

















