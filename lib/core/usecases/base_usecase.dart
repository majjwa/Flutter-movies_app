import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/errors/faluire.dart';
 abstract class BaseUseCase<T,Parameters>{

   Future<Either<Faluire,T>> call(Parameters parameters);



 }
 class NoParameters extends Equatable{
   const NoParameters();
  @override

  List<Object?> get props => [];

 }