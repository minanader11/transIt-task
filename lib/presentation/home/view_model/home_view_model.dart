import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gal/gal.dart';
import 'package:transit_task/domain/entities/popularPeopleResponseEntity.dart';
import 'package:transit_task/domain/use_cases/getPopularPeopleUseCase.dart';
import 'package:transit_task/presentation/home/view_model/homeScreenStates.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel({required this.getPopularPeopleUseCase}):super(HomeScreenInitialState());
  GetPopularPeopleUseCase getPopularPeopleUseCase;
List<PersonResponseEntity> popularPeople=[];
ScrollController scrollController=ScrollController();
int page=1;
  void getPopularPeople()async{
    if(page==1){
    emit(GetPopularMoviesLoadingState());
    } else {

      emit(GetMorePopularMoviesLoadingState());
    }
    var response=await getPopularPeopleUseCase.invoke(page.toString());
    response.fold((l) {
      emit(GetPopularMoviesFailureState(errMsg: l.errMsg));
    }, (r) {
      if(page!=1){
        popularPeople.addAll(r.results??[]);
      }else{
      popularPeople= r.results!;
      }
      print(popularPeople.length);
      print(page);
      emit(GetPopularMoviesSuccessState());
    });
  }
  void downloadImage(String image)async {
    emit(DownloadImageLoadingState());
    try{
    final hasAccess = await Gal.hasAccess(toAlbum: true);
    await Gal.requestAccess(toAlbum: true);
    final path = '${Directory.systemTemp.path}/done.jpg';
    await Dio().download(
      'https://image.tmdb.org/t/p/original${image}',
      path,
    );
    await Gal.putImage(path, album: 'flutter');
    emit(DownloadImageSuccessState());
    }
        catch (e){
         emit(DownloadImageFailureState(errMsg: e.toString()));
        }
  }
}