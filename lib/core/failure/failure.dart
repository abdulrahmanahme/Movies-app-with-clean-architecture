import 'package:equatable/equatable.dart';
import 'package:movies_app/core/server/expations.dart';
 
abstract class Failure extends Equatable{
final String message;
const  Failure({required this.message});
@override
  List<Object?> get props =>[
  message,
  ];
}

class ServerFailure extends Failure{
 const ServerFailure({required super.message});

}
class LocalFailure extends Failure{
  const  LocalFailure({required super.message});

  
}