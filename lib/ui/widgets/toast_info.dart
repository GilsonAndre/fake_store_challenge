//toast responsable to show a bar with text and button
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo({
  required String msg,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    gravity: ToastGravity.TOP,
    fontSize: 16,
    toastLength: Toast.LENGTH_SHORT,
  );
}
