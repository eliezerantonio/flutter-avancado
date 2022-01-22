import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

showAlert(BuildContext context, String title, String subtitle) {
  !Platform.isIOS
      ? showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text(title),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                content: Text(subtitle),
                actions: [
                  MaterialButton(
                    elevation: 5,
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"),
                  )
                ],
              ))
      : showCupertinoDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(subtitle),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Ok"),
              )
            ],
          ),
        );
}
