import 'package:transit_task/domain/entities/failure.dart';

abstract class AuthenticationDataSource{
  Future<Failures?> register(String email, String password);
  Future<Failures?> login(String email, String password);
}