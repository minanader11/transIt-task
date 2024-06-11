import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transit_task/core/theme/colors.dart';
import 'package:transit_task/core/theme/textStyles.dart';
import 'package:transit_task/presentation/authentication/login/view/login_screen.dart';
import 'package:transit_task/presentation/authentication/register/view_model/register_states.dart';
import 'package:transit_task/presentation/authentication/register/view_model/register_view_model.dart';
import 'package:transit_task/utils/customClipPath.dart';
import 'package:transit_task/utils/custom_text_field.dart';
import 'package:transit_task/utils/dialog_utils.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  static const String routeName = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  // RegisterViewModel viewModel =
  //   RegisterViewModel(getGradesUseCase: injectGetGradesUseCase(),getCentersUseCase: injecetGetGradesUseCase(),registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<RegisterViewModel>(context);
    return BlocConsumer<RegisterViewModel, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            DialogUtils.showLoading(context: context);
          } else if (state is RegisterErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context,
                message: state.errorMsg,
                actionName: 'ok',
                posActionFun: () {
                  Navigator.of(context).pop();
                });
          } else if (state is RegisterSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
                context: context,
                message: 'Register Successfully',
                actionName: 'ok',
                posActionFun: () {
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                });
          }
        },
        builder: (context, state) => Scaffold(
              backgroundColor: MyColors.greyColor,
              body: Form(
                key: viewModel.formKey,
                child: SingleChildScrollView(
                  child: ClipPath(
                    clipper: CustomClipPath(),
                    child: Container(
                      margin: EdgeInsets.only(top: 20.h),
                      padding:
                          EdgeInsets.only(top: 60.h, left: 17.w, right: 17.w),
                      color: Colors.white,
                      height: 790.h,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text('Register',
                                  style: Styles.textStyle40.copyWith(
                                      color: MyColors.purpleColor))),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomTextField(
                            hint: 'Enter Your Email',
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
                            height: 17.h,
                          ),
                          CustomTextField(
                            obscureText: true,
                            hint: 'Password',
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
                              Navigator.of(context).pushReplacementNamed(
                                  LoginScreen.routeName);
                            },
                            child: RichText(
                              text: TextSpan(
                                style: Styles.textStyle14,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'You already have an Account'),
                                  TextSpan(
                                      text: 'Login Here',
                                      style: Styles.textStyle14.copyWith(
                                          color: MyColors.purpleColor)),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: ElevatedButton(
                              onPressed: () {
                                viewModel.register();
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
                                padding: EdgeInsets.only(
                                    top: 17.h, bottom: 17.h),
                                child: Text(
                                  'Register',
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
            ));
  }
}
