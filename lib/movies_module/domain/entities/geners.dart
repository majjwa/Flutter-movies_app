import 'package:equatable/equatable.dart';

class Generes extends Equatable {
  final String? name;
  final int id;

  const Generes({ this.name, required this.id});

  @override
  List<Object?> get props => [
        name,
        id,
      ];
}
