class Failures{
  String errMsg;
  Failures({required this.errMsg});
}
class ServerFailure extends Failures{
  ServerFailure({required super.errMsg});
}
class NetworkFailure extends Failures{
  NetworkFailure({required super.errMsg});
}
class HiveFailure extends Failures{
  HiveFailure({required super.errMsg});
}
class FirebaseFailure extends Failures{

  FirebaseFailure({required super.errMsg});
}