import 'package:equatable/equatable.dart';

class Generes extends Equatable {
  final String name;
  final int id;

  const Generes({required this.name, required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        id,
      ];
}
