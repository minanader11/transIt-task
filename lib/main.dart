import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transit_task/domain/di.dart';
import 'package:transit_task/presentation/home/view/home_screen.dart';
import 'package:transit_task/presentation/home/view_model/home_view_model.dart';

void main() {
  runApp( MultiBlocProvider(providers: [BlocProvider(create: (context) => HomeScreenViewModel(getPopularPeopleUseCase: injectGetPopularePeopleUseCase()),)],child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
         HomeScreen.routeName:(context) => HomeScreen(),
        },
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}


