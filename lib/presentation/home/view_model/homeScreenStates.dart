abstract class HomeScreenStates{}
class HomeScreenInitialState extends HomeScreenStates{}
class GetPopularMoviesLoadingState extends HomeScreenStates{}
class GetPopularMoviesSuccessState extends HomeScreenStates{}
class GetPopularMoviesFailureState extends HomeScreenStates{
  String errMsg;
  GetPopularMoviesFailureState({required this.errMsg});
}
class DownloadImageRequestState extends HomeScreenStates{}
class DownloadImageLoadingState extends HomeScreenStates{}
class DownloadImageSuccessState extends HomeScreenStates{}
class DownloadImageFailureState extends HomeScreenStates{
  String errMsg;
  DownloadImageFailureState({required this.errMsg});
}
class GetMorePopularMoviesLoadingState extends HomeScreenStates{}
class GoogleSignOutState extends HomeScreenStates{}
