
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transit_task/domain/use_cases/login_use_case.dart';
import 'package:transit_task/presentation/authentication/login/view_model/login_screen_states.dart';

class LoginViewModel extends Cubit<LoginStates>{

  TextEditingController emailController = TextEditingController(text: 'hubert70@example.com');
  TextEditingController passwordController = TextEditingController(text: '123456');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}): super(LoginInitialState());

  void login()async {
    bool validate=  formKey.currentState!.validate();
    if(validate){

        emit(LoginLoadingState());
       var  response = await loginUseCase.invoke(emailController.text, passwordController.text);
       if(response==null){
         emit(LoginSuccessState());
       } else{
         emit(LoginErrorState(errorMsg: response.errMsg));
       }


    }
  }


}