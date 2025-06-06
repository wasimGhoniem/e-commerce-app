import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/dialog_utils.dart';
import 'package:e_commerce_app/core/utils/validators.dart';
import 'package:e_commerce_app/features/ui/auth/register/cubit/register_states.dart';
import 'package:e_commerce_app/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/l10n/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterStates>(
        bloc: RegisterViewModel.get(context)..register(),
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            DialogUtils.showLoading(
                context: context,
                message: AppLocalizations.of(context)!.loading);
          } else if (state is RegisterSuccessState) {
            DialogUtils.hideLoading(context: context);
            DialogUtils.showMessage(
                context: context,
                message: AppLocalizations.of(context)!.registerSuccess,
                title: AppLocalizations.of(context)!.success,
                posActionName: AppLocalizations.of(context)!.ok,
                posAction: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
                });
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
              context: context,
                message: state.failures.errorMessage,
                title: AppLocalizations.of(context)!.error,
                posActionName: AppLocalizations.of(context)!.ok,
                posAction: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);
                });
        }
      } ,
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                    SizedBox(height: 46.h),
                    Text(AppLocalizations.of(context)!.fullName, style: AppStyles.medium18White),
                    SizedBox(height: 8.h),
                    Form(
                        key: RegisterViewModel.get(context).formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                                validator: (value) {
                                  return AppValidators.validateName(
                                      value, context);
                                },
                                controller: RegisterViewModel.get(context)
                                    .nameController,
                                hint:
                                    AppLocalizations.of(context)!.enterFullName,
                                fillColor: Colors.white,
                                borderRadius: 15,
                                textStyle: AppStyles.light18hintTextColor,
                                hintStyle: AppStyles.light18hintTextColor),
                            SizedBox(height: 24.h),
                            Text(AppLocalizations.of(context)!.enterMobileNumber, style: AppStyles.medium18White),
                            SizedBox(height: 8.h),
                            CustomTextFormField(
                              controller: RegisterViewModel.get(context)
                                  .mobileController,
                              validator: (value) {
                                return AppValidators.validateMobileNumber(
                                    value, context);
                              },
                              hint: AppLocalizations.of(context)!
                                  .enterMobileNumber,
                              fillColor: Colors.white,
                              borderRadius: 15,
                              textStyle: AppStyles.light18hintTextColor,
                              hintStyle: AppStyles.light18hintTextColor,
                              keyboardType: TextInputType.phone,
                            ),
                            SizedBox(height: 24.h),
                            Text(AppLocalizations.of(context)!.emailAddress, style: AppStyles.medium18White),
                            SizedBox(height: 8.h),
                            CustomTextFormField(
                              controller: RegisterViewModel.get(context)
                                  .emailController,
                              validator: (value) {
                                return AppValidators.validateEmail(
                                    value, context);
                              },
                              hint: AppLocalizations.of(context)!.enterEmail,
                              fillColor: Colors.white,
                              borderRadius: 15,
                              textStyle: AppStyles.light18hintTextColor,
                              hintStyle: AppStyles.light18hintTextColor,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 24.h),
                            Text(AppLocalizations.of(context)!.password, style: AppStyles.medium18White),
                            SizedBox(height: 8.h),
                            CustomTextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: RegisterViewModel.get(context)
                                  .passwordController,
                              validator: (value) {
                                return AppValidators.validatePassword(
                                    value, context);
                              },
                              hint: AppLocalizations.of(context)!.enterPassword,
                              fillColor: Colors.white,
                              borderRadius: 15,
                              textStyle: AppStyles.light18hintTextColor,
                              hintStyle: AppStyles.light18hintTextColor,
                              obscureText: RegisterViewModel.get(context)
                                  .obscureTextPassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  RegisterViewModel.get(context).onPassClick();
                                },
                                icon: Icon(
                                  RegisterViewModel.get(context)
                                          .obscureTextPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.hintTextColor,
                                ),
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Text(AppLocalizations.of(context)!.rePassword, style: AppStyles.medium18White),
                            SizedBox(height: 8.h),
                            CustomTextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: RegisterViewModel.get(context)
                                  .rePasswordController,
                              validator: (value) {
                                return AppValidators.validateRePassword(
                                    value,
                                    RegisterViewModel.get(context)
                                        .passwordController
                                        .text,
                                    context);
                              },
                              hint: AppLocalizations.of(context)!.enterPassword,
                              fillColor: Colors.white,
                              borderRadius: 15,
                              textStyle: AppStyles.light18hintTextColor,
                              hintStyle: AppStyles.light18hintTextColor,
                              obscureText: RegisterViewModel.get(context)
                                  .obscureTextRePassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  RegisterViewModel.get(context)
                                      .onRePassClick();
                                },
                                icon: Icon(
                                  RegisterViewModel.get(context)
                                          .obscureTextRePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.hintTextColor,
                                ),
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                                AppLocalizations.of(context)!
                                    .enter_your_address,
                                style: AppStyles.medium18White),
                            SizedBox(height: 8.h),
                            CustomTextFormField(
                              keyboardType: TextInputType.streetAddress,
                              controller: RegisterViewModel.get(context)
                                  .addressController,
                              validator: (value) {
                                return AppValidators.validateName(
                                    value, context);
                              },
                              hint: 'Enter Your Address',
                              fillColor: Colors.white,
                              borderRadius: 15,
                              textStyle: AppStyles.light18hintTextColor,
                              hintStyle: AppStyles.light18hintTextColor,
                            ),
                            SizedBox(height: 56.h),
                            CustomElevatedButton(
                              text: AppLocalizations.of(context)!.signUp,
                              onPressed: () {
                                RegisterViewModel.get(context).register();
                              },
                            ),
                          ],
                        )),
                    SizedBox(height: 64.h),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
