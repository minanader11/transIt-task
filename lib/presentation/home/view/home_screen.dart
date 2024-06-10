import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transit_task/presentation/home/view/widgets/personeListItem.dart';
import 'package:transit_task/presentation/home/view_model/homeScreenStates.dart';
import 'package:transit_task/presentation/home/view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget{
  static const String routeName='HomeScreen';
  @override
  Widget build(BuildContext context) {
    var homeCubit= BlocProvider.of<HomeScreenViewModel>(context)..getPopularPeople('1');
    return Scaffold(
        body: BlocBuilder<HomeScreenViewModel,HomeScreenStates>(builder: (context, state) {
        if(state is GetPopularMoviesLoadingState){
          return Center(child: CircularProgressIndicator(),);
        } else if (state is GetPopularMoviesFailureState){
          return Center(child: Text(state.errMsg),);
        } else {
          return ListView.builder(itemCount: homeCubit.popularPeople.length,itemBuilder: (context, index) {
            return PersonListItem(personResponseEntity: homeCubit.popularPeople[index]);
          },);
        }
      },),
    );

  }
}