abstract class HomeScreenStates{}
class HomeScreenInitialState extends HomeScreenStates{}
class GetPopularMoviesLoadingState extends HomeScreenStates{}
class GetPopularMoviesSuccessState extends HomeScreenStates{}
class GetPopularMoviesFailureState extends HomeScreenStates{
  String errMsg;
  GetPopularMoviesFailureState({required this.errMsg});
}