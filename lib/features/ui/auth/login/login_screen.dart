import 'package:e_commerce_app/core/cache/shared_preference_utils.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/dialog_utils.dart';
import 'package:e_commerce_app/features/ui/auth/login/cubit/login_states.dart';
import 'package:e_commerce_app/features/ui/auth/login/cubit/login_view_model.dart';
import 'package:e_commerce_app/l10n/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/validators.dart';
import '../../../../dependency_injection/di.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginViewModel, LoginStates>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is LoginLoadingState) {
            DialogUtils.showLoading(
                context: context,
                message: AppLocalizations.of(context)!.loading);
          } else if (state is LoginErrorState) {
            DialogUtils.hideLoading(context: context);
            DialogUtils.showMessage(
                context: context,
                message: state.failures.errorMessage,
                title: AppLocalizations.of(context)!.error,
                posActionName: AppLocalizations.of(context)!.ok);
          } else if (state is LoginSuccessState) {
            DialogUtils.hideLoading(context: context);
            DialogUtils.showMessage(
                context: context,
                message: AppLocalizations.of(context)!.loginSuccess,
                title: AppLocalizations.of(context)!.success,
                posActionName: AppLocalizations.of(context)!.ok,
                posAction: () => Navigator.pushReplacementNamed(
                    context, AppRoutes.homeRoute));
            SharedPreferenceUtils.saveData(
                key: 'token', value: state.loginResponseEntity.token);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 85.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppAssets.routeIcon),
                        ],
                      ),
                      SizedBox(height: 87.h),
                      Text(
                        AppLocalizations.of(context)!.welcomeBack,
                        style: AppStyles.medium18White,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        AppLocalizations.of(context)!.signInPrompt,
                        style: AppStyles.light12White,
                      ),
                      SizedBox(height: 40.h),
                      Text(AppLocalizations.of(context)!.emailAddress,
                          style: AppStyles.medium18White),
                      SizedBox(height: 24.h),
                      Form(
                          key: viewModel.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextFormField(
                                  validator: (value) {
                                    return AppValidators.validateEmail(
                                        value, context);
                                  },
                                  controller: viewModel.emailController,
                                  hint:
                                      AppLocalizations.of(context)!.enterEmail,
                                  fillColor: Colors.white,
                                  borderRadius: 15,
                                  textStyle: AppStyles.light18hintTextColor,
                                  hintStyle: AppStyles.light18hintTextColor),
                              SizedBox(height: 32.h),
                              Text(AppLocalizations.of(context)!.password,
                                  style: AppStyles.medium18White),
                              SizedBox(height: 24.h),
                              CustomTextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                controller: viewModel.passwordController,
                                validator: (value) {
                                  return AppValidators.validatePassword(
                                      value, context);
                                },
                                hint:
                                    AppLocalizations.of(context)!.enterPassword,
                                fillColor: Colors.white,
                                borderRadius: 15,
                                textStyle: AppStyles.light18hintTextColor,
                                hintStyle: AppStyles.light18hintTextColor,
                                obscureText: viewModel.obscureTextPassword,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    viewModel.onPassClick();
                                  },
                                  icon: Icon(
                                    viewModel.obscureTextPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: AppColors.hintTextColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                      AppLocalizations.of(context)!
                                          .forgotPassword,
                                      style: AppStyles.light12White),
                                ],
                              ),
                              SizedBox(height: 56.h),
                              CustomElevatedButton(
                                text: AppLocalizations.of(context)!.login,
                                onPressed: () {
                                  viewModel.login();
                                },
                              ),
                              SizedBox(height: 32.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.noAccount,
                                    style: AppStyles.light12White,
                                  ),
                                  InkWell(
                                      onTap: () =>
                                          viewModel.navigateToRegister(),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .createAccount,
                                        style: AppStyles.light12White,
                                      )),
                                ],
                              )
                            ],
                          )),
                      SizedBox(height: 32.h),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
