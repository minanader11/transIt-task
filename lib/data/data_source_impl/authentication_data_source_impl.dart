import 'package:transit_task/data/firebase/firebase_utils.dart';
import 'package:transit_task/domain/data_source/authentication_data_source.dart';
import 'package:transit_task/domain/entities/failure.dart';

class AuthenticationDataSourceImpl implements AuthenticationDataSource{
  FirebaseUtils firebaseUtils;
  AuthenticationDataSourceImpl({required this.firebaseUtils});
  @override
  Future<Failures?> login(String email, String password) {
    return firebaseUtils.login(email, password);
  }

  @override
  Future<Failures?> register(String email, String password) {
    return firebaseUtils.register(email, password);
  }

}