import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(
      {required BuildContext context, required String message}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: AppStyles.semiBold20primary,
                  ),
                ),
              ],
            ),
          );
        });
  }

  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
  }) {
    List<Widget>actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActionName, style: AppStyles.semiBold20primary,)

      )
      );
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName, style: AppStyles.semiBold20primary,)

      ));
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(message, style: AppStyles.semiBold20primary,),
            title: Text(title ?? '', style: AppStyles.semiBold20primary,),
            actions: actions,

          );
        });
  }
}
