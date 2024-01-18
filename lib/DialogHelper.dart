import 'package:flutter/material.dart';

class DialogHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  static void showErrorDialog(String errorMessage) {
    showDialog(
      context: navigatorKey.currentState!.overlay!.context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void showSuccessDialog(String successMessage) {
    showDialog(
      context: navigatorKey.currentState!.overlay!.context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(successMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
