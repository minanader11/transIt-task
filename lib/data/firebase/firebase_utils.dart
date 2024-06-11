import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transit_task/domain/entities/failure.dart';

class FirebaseUtils {
  static FirebaseUtils? _instance;

  FirebaseUtils._();

  static FirebaseUtils getInstance() {
    _instance ??= FirebaseUtils._();
    return _instance!;
  }

  Future<Failures?> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        print('No user found for that email.');
        return FirebaseFailure(errMsg: e.toString());

      }
    } catch (e) {
      return Failures(errMsg: e.toString());
    }
  }

  Future<Failures?> register(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return FirebaseFailure(errMsg: e.toString());
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return FirebaseFailure(errMsg: e.toString());
      }
    } catch (e) {
      print(e);
      return Failures(errMsg: e.toString());
    }
  }
}
