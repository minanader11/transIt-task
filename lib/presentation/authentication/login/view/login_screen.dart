import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:transit_task/core/theme/colors.dart';
import 'package:transit_task/core/theme/textStyles.dart';
import 'package:transit_task/presentation/authentication/login/view_model/login_screen_states.dart';
import 'package:transit_task/presentation/authentication/login/view_model/login_screen_view_model.dart';
import 'package:transit_task/presentation/authentication/register/view/register_screen.dart';
import 'package:transit_task/presentation/home/view/home_screen.dart';
import 'package:transit_task/utils/customClipPath.dart';
import 'package:transit_task/utils/custom_text_field.dart';
import 'package:transit_task/utils/dialog_utils.dart';

class LoginScreen extends StatefulWidget{
  static const String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = BlocProvider.of<LoginViewModel>(context);
    return BlocListener<LoginViewModel,LoginStates>(

      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context);
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.errorMsg,
              actionName: 'ok',
              posActionFun: () {
                DialogUtils.hideLoading(context);
              });
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: 'LoginSuccessfully',
              actionName: 'ok',
              posActionFun: () {
                Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
              });
         // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

          // DialogUtils.showMessage(
          //     context: context,
          //     message: 'Login Successfully',
          //     actionName: 'ok',
          //     posActionFun: () {
          //       Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
          //     });
        }
      },
      child: Scaffold(
        backgroundColor: MyColors.greyColor,
        body: Form(
          key: viewModel.formKey,
          child: SingleChildScrollView(
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                margin: EdgeInsets.only(top: 20.h),
                padding: EdgeInsets.only(top: 60.h, left: 17.w,right: 17.w),
                color: Colors.white,
                height: 790.h,
                width: double.infinity,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                       'Login',
                        style: Styles.textStyle40.copyWith(color: MyColors.purpleColor),
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

                    // Padding(
                    //   padding: EdgeInsets.only(right: 15.w),
                    //   child: Text(
                    //     MyTexts.forgetPassword,
                    //     style: Styles.textStyle18,
                    //     textAlign: TextAlign.end,
                    //   ),
                    // ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // InkWell(
                    //   onTap: () => Navigator.of(context)
                    //       .pushNamed(RegisterScreen.routeName),
                    //   child: Text(
                    //     MyTexts.dontHaveAccount,
                    //     textAlign: TextAlign.center,
                    //     style: Styles.textStyle18.copyWith(color:MyColors.darkGreyColor),
                    //   ),
                    // ),
                    InkWell(onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RegisterScreen.routeName);
                    },
                      child: RichText(
                        text: TextSpan(

                          style:Styles.textStyle14,
                          children: <TextSpan>[
                            TextSpan(text: "don't have an account?"),
                            TextSpan(text:'register Here', style: Styles.textStyle14.copyWith(color: MyColors.purpleColor)),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.login();
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
                    ),
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