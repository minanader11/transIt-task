import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transit_task/core/theme/colors.dart';
import 'package:transit_task/core/theme/textStyles.dart';
import 'package:transit_task/presentation/home/view/widgets/personeListItem.dart';
import 'package:transit_task/presentation/home/view_model/homeScreenStates.dart';
import 'package:transit_task/presentation/home/view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget{
  static const String routeName='HomeScreen';
  @override
  Widget build(BuildContext context) {
    var homeCubit= BlocProvider.of<HomeScreenViewModel>(context)..getPopularPeople('1');
    return Scaffold(backgroundColor: MyColors.whiteColor,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 30.h),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Popular People',style: Styles.textStyle40.copyWith(color: MyColors.purpleColor),),
              BlocBuilder<HomeScreenViewModel,HomeScreenStates>(builder: (context, state) {
              if(state is GetPopularMoviesLoadingState){
                return Center(child: CircularProgressIndicator(),);
              } else if (state is GetPopularMoviesFailureState){
                return Center(child: Text(state.errMsg),);
              } else {
                return Expanded(
                  child: ListView.builder(itemCount: homeCubit.popularPeople.length,itemBuilder: (context, index) {
                    return PersonListItem(personResponseEntity: homeCubit.popularPeople[index]);
                  },),
                );
              }
                    },),
            ],
          ),
        ),
    );

  }
}