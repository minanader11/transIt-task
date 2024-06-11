abstract class RegisterStates{}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{

  RegisterSuccessState();
}
class RegisterErrorState extends RegisterStates{
  String errorMsg;
  RegisterErrorState({required this.errorMsg});
}