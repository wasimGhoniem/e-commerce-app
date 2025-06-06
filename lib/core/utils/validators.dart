import 'package:flutter/material.dart';

import '../../l10n/localization/app_localizations.dart';

class AppValidators {
  AppValidators._();

  static String? validateEmail(String? value, BuildContext context) {
    RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterEmail;
    } else if (!emailRegex.hasMatch(value)) {
      return AppLocalizations.of(context)!.pleaseEnterValidEmail;
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value, BuildContext context) {
    RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
    );
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterPassword;
    } else if (!passwordRegex.hasMatch(value)) {
      return AppLocalizations.of(context)!.pleaseEnterValidPassword;
    } else {
      return null;
    }
  }

  static String? validateName(String? value, BuildContext context) {
    RegExp nameRegex = RegExp(
      r"^[a-zA-Z\s'-]+$",
    );
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterName;
    } else if (!nameRegex.hasMatch(value)) {
      return AppLocalizations.of(context)!.pleaseEnterValidName;
    } else {
      return null;
    }
  }

  static String? validateProductName(String? value, BuildContext context) {
    RegExp nameRegex = RegExp(
      r"^[a-zA-Z\s'-]+$",
    );
    if (value == null || value.trim().isEmpty) {
      return 'please enter product name ';
    } else if (!nameRegex.hasMatch(value)) {
      return 'please enter a valid product name';
    } else {
      return null;
    }
  }

  static String? validateMobileNumber(String? value, BuildContext context) {
    RegExp mobileRegex = RegExp(
      r'^\+?[0-9]{11}$',
    );
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterMobile;
    } else if (!mobileRegex.hasMatch(value)) {
      return AppLocalizations.of(context)!.pleaseEnterValidMobile;
    } else {
      return null;
    }
  }

  static String? validateRePassword(String? value, String? password, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)!.pleaseConfirmPassword;
    } else if (value != password) {
      return AppLocalizations.of(context)!.passwordsDoNotMatch;
    } else {
      return null;
    }
  }
}