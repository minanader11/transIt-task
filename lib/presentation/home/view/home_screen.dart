import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transit_task/core/theme/colors.dart';
import 'package:transit_task/core/theme/textStyles.dart';
import 'package:transit_task/presentation/authentication/login/view/login_screen.dart';
import 'package:transit_task/presentation/home/view/widgets/personeListItem.dart';
import 'package:transit_task/presentation/home/view_model/homeScreenStates.dart';
import 'package:transit_task/presentation/home/view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override

  @override
  Widget build(BuildContext context) {
    var homeCubit = BlocProvider.of<HomeScreenViewModel>(context)..getPopularPeople();
    homeCubit.scrollController.addListener(() {
      if(homeCubit.scrollController.position.atEdge &&homeCubit.scrollController.position.atEdge!=0 ){
        homeCubit.page++;
        homeCubit.getPopularPeople();
      }
    });

    return Scaffold(backgroundColor: MyColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Popular People',
                  style: Styles.textStyle40.copyWith(color: MyColors.purpleColor),),
                Spacer(),
                IconButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);

                }, icon: Icon(Icons.logout))
              ],
            ),
            BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
              builder: (context, state) {
                if (state is GetPopularMoviesLoadingState) {
                  return Center(child: CircularProgressIndicator(),);
                } else if (state is GetPopularMoviesFailureState) {
                  return Center(child: Text(state.errMsg),);
                } else {
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            controller: homeCubit.scrollController,
                            itemCount: homeCubit.popularPeople.length,
                            itemBuilder: (context, index) {
                              return PersonListItem(personResponseEntity: homeCubit
                                  .popularPeople[index]);
                            },),
                        ),
                       SizedBox(height: 10,),
                       state is GetMorePopularMoviesLoadingState? CircularProgressIndicator():Container()
                      ],
                    ),
                  );
                }
              },),
          ],
        ),
      ),
    );
  }
}