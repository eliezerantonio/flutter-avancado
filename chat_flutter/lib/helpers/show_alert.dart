import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

showAlert(BuildContext context, String title, String subtitle) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(title),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Text(subtitle),
      actions: [
        MaterialButton(
          elevation: 5,
          color: Colors.blue,
          onPressed: () {},
          child: Text("Kk"),
        )
      ],
    ),
  );
}
