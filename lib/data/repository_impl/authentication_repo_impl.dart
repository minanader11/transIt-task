import 'package:transit_task/domain/data_source/authentication_data_source.dart';
import 'package:transit_task/domain/entities/failure.dart';
import 'package:transit_task/domain/repository/authentication_repo.dart';

class AuthenticationRepoImpl implements AuthenticationRepository{
  AuthenticationDataSource authenticationDataSource;
  AuthenticationRepoImpl({required this.authenticationDataSource});

  @override
  Future<Failures?> login(String email, String password) {
return authenticationDataSource.login(email, password);
  }

  @override
  Future<Failures?> register(String email, String password) {
return authenticationDataSource.register(email, password);
  }

}