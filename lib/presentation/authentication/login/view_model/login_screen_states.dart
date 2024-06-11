
abstract class LoginStates{}
class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{

  LoginSuccessState();
}
class LoginErrorState extends LoginStates{
  String errorMsg;
  LoginErrorState({required this.errorMsg});
}

class LoginWithGoogleLoadingState extends LoginStates{}
class LoginWithGoogleSuccessState extends LoginStates{


}
class LoginWithGoogleErrorState extends LoginStates{
  String errorMsg;
  LoginWithGoogleErrorState({required this.errorMsg});
}