import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:transit_task/domain/di.dart';
import 'package:transit_task/domain/entities/popularPeopleResponseEntity.dart';
import 'package:transit_task/my_bloc_observer.dart';
import 'package:transit_task/presentation/authentication/login/view/login_screen.dart';
import 'package:transit_task/presentation/authentication/login/view_model/login_screen_view_model.dart';
import 'package:transit_task/presentation/authentication/register/view/register_screen.dart';
import 'package:transit_task/presentation/authentication/register/view_model/register_view_model.dart';
import 'package:transit_task/presentation/home/view/home_screen.dart';
import 'package:transit_task/presentation/home/view_model/home_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:bloc/bloc.dart';
void main() async {
  Bloc.observer=MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(PopularPeopleResponseEntityAdapter());
  Hive.registerAdapter(PersonResponseEntityAdapter());
  Hive.registerAdapter(KnownForResponseEntityAdapter());

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => HomeScreenViewModel(
          getPopularPeopleUseCase: injectGetPopularePeopleUseCase()),
    ),
    BlocProvider(
      create: (context) => LoginViewModel(loginUseCase: injectLoginUseCase(),loginWithGoogleUseCase: injectLoginWithGoogleUseCase()),
    ),
    BlocProvider(
      create: (context) =>
          RegisterViewModel(registerUseCase: injectRegisterUseCase()),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          RegisterScreen.routeName:(context) => RegisterScreen()
        },
        initialRoute: LoginScreen.routeName,
      ),
    );
  }
}
