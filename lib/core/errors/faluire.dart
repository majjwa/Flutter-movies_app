import 'package:equatable/equatable.dart';

abstract class Faluire extends Equatable{
final String message;

  const Faluire(this.message);

@override
  List<Object> get props =>[message];
}
class serverFail extends Faluire{
  const serverFail(super.message);

}
class dataBaseFail extends Faluire{
  const dataBaseFail(super.message);

}