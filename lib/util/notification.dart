import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:voting_app/constants/color_list.dart';

class AppNotification {
  static error({required String error}) {
    Fluttertoast.showToast(
      msg: error,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  static notify({required String notificationMessage}) {
    Fluttertoast.showToast(
      msg: notificationMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: ColorList.primaryColor,
      textColor: Colors.white,
      fontSize: 16,
    );
  }
}
