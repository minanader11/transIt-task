import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transit_task/domain/entities/failure.dart';
import 'package:transit_task/domain/repository/authentication_repo.dart';

class LoginWithGoogleUseCase{
  AuthenticationRepository authenticationRepository;
  LoginWithGoogleUseCase({required this.authenticationRepository});
  Future<Either<Failures?,UserCredential>> invoke(){
    return authenticationRepository.loginWithGoogle();
  }
}