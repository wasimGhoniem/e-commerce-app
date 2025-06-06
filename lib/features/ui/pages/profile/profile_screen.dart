import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/dialog_utils.dart';
import 'package:e_commerce_app/core/utils/validators.dart';
import 'package:e_commerce_app/features/ui/pages/profile/cubit/profile_states.dart';
import 'package:e_commerce_app/features/ui/pages/profile/cubit/profile_view_model.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ProfileViewModel.get(context);
    viewModel.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: BlocConsumer<ProfileViewModel, ProfileStates>(
          bloc: viewModel,
          listener: (context, state) {
            if (state is ProfileErrorState) {
              DialogUtils.showMessage(
                  context: context,
                  message: state.failures.errorMessage,
                  posActionName: 'Ok');
            }
            if (state is UpdateLoggedUserErrorState) {
              DialogUtils.showMessage(
                  context: context,
                  message: state.failures.errorMessage,
                  posActionName: 'Ok');
            } else if (state is ProfileLogOutState) {
              DialogUtils.showMessage(
                  context: context,
                  message: 'log out successfully',
                  posActionName: 'Ok',
                  posAction: () => Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.loginRoute));
            } else if (state is UpdateLoggedUserSuccessState) {
              DialogUtils.showMessage(
                  context: context,
                  message: 'user data updated successfully',
                  posActionName: 'Ok');
            }
          },
          builder: (context, state) {
            if (state is ProfileLoadingState ||
                state is UpdateLoggedUserLoadingState) {
              return Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ));
            } else if (state is ProfileSuccessState ||
                state is ProfileInitialState ||
                state is ProfileErrorState ||
                state is UpdateLoggedUserSuccessState ||
                state is UpdateLoggedUserErrorState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(AppAssets.routeBarIcon, height: 30.h),
                      SizedBox(height: 8.h),
                      Text(
                        'Welcome, ${viewModel.fullNameController.text.split(' ').first}',
                        style: AppStyles.light18hintText,
                      ),
                      Text(
                        viewModel.emailController.text,
                        style: AppStyles.light14hTextColor,
                      ),
                      SizedBox(height: 24.h),
                      Text('full name', style: AppStyles.light18hintText),
                      SizedBox(
                        height: 16.h,
                      ),
                      Form(
                        key: viewModel.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              validator: (value) {
                                return AppValidators.validateName(
                                    value, context);
                              },
                              textStyle: AppStyles.textColor14,
                              borderRadius: 15.r,
                              controller: viewModel.fullNameController,
                              enabled: true,
                              suffixIcon: Icon(Icons.edit,
                                  size: 18, color: AppColors.hintTextColor),
                            ),
                            SizedBox(height: 16.h),
                            Text('E-mail', style: AppStyles.light18hintText),
                            SizedBox(
                              height: 16.h,
                            ),
                            CustomTextFormField(
                              validator: (value) {
                                return AppValidators.validateEmail(
                                    value, context);
                              },
                              textStyle: AppStyles.textColor14,
                              borderRadius: 15.r,
                              controller: viewModel.emailController,
                              enabled: true,
                              suffixIcon: Icon(Icons.edit,
                                  size: 18, color: AppColors.hintTextColor),
                            ),
                            SizedBox(height: 16.h),
                            Text('mobile number',
                                style: AppStyles.light18hintText),
                            SizedBox(
                              height: 16.h,
                            ),
                            CustomTextFormField(
                              validator: (value) {
                                return AppValidators.validateMobileNumber(
                                    value, context);
                              },
                              textStyle: AppStyles.textColor14,
                              controller: viewModel.mobileController,
                              enabled: true,
                              suffixIcon: Icon(Icons.edit,
                                  size: 18, color: AppColors.hintTextColor),
                            ),
                            SizedBox(height: 16.h),
                            Text('Address', style: AppStyles.light18hintText),
                            SizedBox(
                              height: 16.h,
                            ),
                            CustomTextFormField(
                              textStyle: AppStyles.textColor14,
                              controller: viewModel.addressController,
                              enabled: true,
                              suffixIcon: Icon(Icons.edit,
                                  size: 18, color: AppColors.hintTextColor),
                            ),
                            SizedBox(height: 24.h),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  //todo save update
                                  viewModel.updateLoggedUserData();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                ),
                                child: Text(
                                  'Save',
                                  style: AppStyles.medium18White,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            //todo logout
                            viewModel.logout();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                          ),
                          child: Text(
                            'Log Out',
                            style: AppStyles.medium18White,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink(); // Fallback for unexpected states
            }
          },
        ),
      ),
    );
  }
}
