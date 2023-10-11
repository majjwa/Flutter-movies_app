import 'package:equatable/equatable.dart';

class Recommendation extends Equatable{
  final String backdrobPath;
  final int id;

  const Recommendation({
      required this.backdrobPath,
      required   this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [backdrobPath,id];
}