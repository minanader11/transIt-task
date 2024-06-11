import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:transit_task/domain/use_cases/loginWithGoogleUseCase.dart';
import 'package:transit_task/domain/use_cases/login_use_case.dart';
import 'package:transit_task/presentation/authentication/login/view_model/login_screen_states.dart';

class LoginViewModel extends Cubit<LoginStates> {

  TextEditingController emailController = TextEditingController(
      );
  TextEditingController passwordController = TextEditingController(
      );
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginUseCase loginUseCase;
  LoginWithGoogleUseCase loginWithGoogleUseCase;

  LoginViewModel({required this.loginUseCase,required this.loginWithGoogleUseCase}) : super(LoginInitialState());

  void login() async {
    bool validate = formKey.currentState!.validate();
    if (validate) {
      emit(LoginLoadingState());
      var response = await loginUseCase.invoke(
          emailController.text, passwordController.text);
      if (response == null) {
        emit(LoginSuccessState());
      } else {
        emit(LoginErrorState(errorMsg: response.errMsg));
      }
    }
  }

  void loginWithGoogle() async {
   var response = await loginWithGoogleUseCase.invoke();
   response.fold((l) {
     emit(LoginWithGoogleErrorState(errorMsg: l!.errMsg));
   }, (r) {
     emit(LoginWithGoogleSuccessState());
   });
   //  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
   //
   //  // Obtain the auth details from the request
   //  final GoogleSignInAuthentication? googleAuth = await googleUser
   //      ?.authentication;
   //
   //  // Create a new credential
   //  final credential = GoogleAuthProvider.credential(
   //    accessToken: googleAuth?.accessToken,
   //    idToken: googleAuth?.idToken,
   //  );
   //
   //  // Once signed in, return the UserCredential
   //  await FirebaseAuth.instance.signInWithCredential(credential);
  }
}