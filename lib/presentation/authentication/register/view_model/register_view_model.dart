import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transit_task/domain/use_cases/register_use_case.dart';
import 'package:transit_task/presentation/authentication/register/view_model/register_states.dart';

class RegisterViewModel extends Cubit<RegisterStates>{
  RegisterViewModel({required this.registerUseCase}):super(RegisterInitialState());


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RegisterUseCase registerUseCase;


  void register(bool validate)async {



    if(validate){
      emit(RegisterLoadingState());

       var response = await registerUseCase.invoke(emailController.text, passwordController.text);
      emailController.clear();
      passwordController.clear();
       if(response == null){
       emit(RegisterSuccessState());
       }else{
         emit(RegisterErrorState(errorMsg: response.errMsg));
       }
     }

  }


}