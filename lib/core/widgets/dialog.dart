import 'package:flutter/material.dart';

class AppDialog {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return PopScope(
            canPop: false,
            child: Dialog(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(width: 16.0),
                  Text('Loading...'),
                ],
              ),
            )),
          );
        });
  }

  static void hideLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
