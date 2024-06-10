import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transit_task/domain/entities/popularPeopleResponseEntity.dart';
import 'package:transit_task/domain/use_cases/getPopularPeopleUseCase.dart';
import 'package:transit_task/presentation/home/view_model/homeScreenStates.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel({required this.getPopularPeopleUseCase}):super(HomeScreenInitialState());
  GetPopularPeopleUseCase getPopularPeopleUseCase;
List<PersonResponseEntity> popularPeople=[];
  void getPopularPeople(String page)async{
    emit(GetPopularMoviesLoadingState());
    var response=await getPopularPeopleUseCase.invoke(page);
    response.fold((l) {
      emit(GetPopularMoviesFailureState(errMsg: l.errMsg));
    }, (r) {
      popularPeople= r.results!;
      emit(GetPopularMoviesSuccessState());
    });
  }
}