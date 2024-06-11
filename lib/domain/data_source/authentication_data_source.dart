import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transit_task/domain/entities/failure.dart';

abstract class AuthenticationDataSource{
  Future<Failures?> register(String email, String password);
  Future<Failures?> login(String email, String password);
  Future<Either<Failures?,UserCredential>> loginWithGoogle();
}