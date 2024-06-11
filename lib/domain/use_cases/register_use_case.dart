import 'package:transit_task/domain/entities/failure.dart';
import 'package:transit_task/domain/repository/authentication_repo.dart';

class RegisterUseCase{
  AuthenticationRepository authenticationRepository;
  RegisterUseCase({required this.authenticationRepository});
  Future<Failures?> invoke(String email, String password){
    return authenticationRepository.register(email, password);
  }
}