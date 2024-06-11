import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:transit_task/core/theme/colors.dart';
import 'package:transit_task/core/theme/textStyles.dart';
import 'package:transit_task/presentation/authentication/login/view_model/login_screen_states.dart';
import 'package:transit_task/presentation/authentication/login/view_model/login_screen_view_model.dart';
import 'package:transit_task/presentation/authentication/register/view/register_screen.dart';
import 'package:transit_task/presentation/home/view/home_screen.dart';
import 'package:transit_task/utils/customClipPath.dart';
import 'package:transit_task/utils/custom_text_field.dart';
import 'package:transit_task/utils/dialog_utils.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'LoginScreen';

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<LoginViewModel>(context);
    return BlocListener<LoginViewModel, LoginStates>(

      listener: (context, state) {
        if (state is LoginLoadingState) {
          print('show Loading');
          DialogUtils.showLoading(context: context);
        } else if (state is LoginErrorState) {
          Navigator.of(context).pop();
          DialogUtils.showMessage(
              context: context,
              message: state.errorMsg,
              actionName: 'ok',
              posActionFun: () {
                Navigator.of(context).pop();
              });
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: 'LoginSuccessfully',
              actionName: 'ok',
              posActionFun: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .pushNamed(HomeScreen.routeName);
              });
        } else if (state is LoginWithGoogleSuccessState) {
          DialogUtils.showMessage(
              context: context,
              message: 'LoginSuccessfully',
              actionName: 'ok',
              posActionFun: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .pushNamed(HomeScreen.routeName);
              });
        } else if (state is LoginWithGoogleErrorState) {
          DialogUtils.showMessage(
              context: context,
              message: state.errorMsg,
              actionName: 'ok',
              posActionFun: () {
                Navigator.of(context).pop();
              });
        }
      },
      child: Scaffold(
        backgroundColor: MyColors.greyColor,
        body: Form(
          key: loginFormKey,
          child: SingleChildScrollView(
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                margin: EdgeInsets.only(top: 20.h),
                padding: EdgeInsets.only(top: 60.h, left: 17.w, right: 17.w),
                color: Colors.white,
                height: 790.h,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Login',
                        style: Styles.textStyle40
                            .copyWith(color: MyColors.purpleColor),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      hint: 'Enter your Email ',
                      controller: viewModel.emailController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Your Email';
                        }
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return 'Please enter Valid Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      obscureText: true,
                      hint: 'Enter Your Password',
                      controller: viewModel.passwordController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Your Password';
                        }
                        if (text.trim().length < 6) {
                          return 'Password must contains at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RegisterScreen.routeName);
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: Styles.textStyle14,
                          children: <TextSpan>[
                            TextSpan(text: "don't have an account?"),
                            TextSpan(
                                text: 'register Here',
                                style: Styles.textStyle14
                                    .copyWith(color: MyColors.purpleColor)),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        bool validate = loginFormKey.currentState!.validate();
                        viewModel.login(validate);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.purpleColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            50.r,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 17.h, bottom: 17.h),
                        child: Text(
                          'Login',
                          style: Styles.textStyle18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.purpleColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              50.r,
                            ),
                          ),
                        ),
                        onPressed: () {
                          viewModel.loginWithGoogle();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          width: 300.w,
                          height: 60.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  child: Image.asset('assets/images/google.png',
                                      fit: BoxFit.fill)),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Sign-in with Google',
                                style: Styles.textStyle18,
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 100.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
