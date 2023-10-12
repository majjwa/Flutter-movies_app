import 'package:equatable/equatable.dart';

class Recommendation extends Equatable{
  final String? backdrobPath;
  final int id;

  const Recommendation({
          this.backdrobPath,
          required this.id,
  });

  @override
  List<Object?> get props => [backdrobPath,id];
}