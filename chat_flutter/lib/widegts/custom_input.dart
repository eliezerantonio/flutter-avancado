import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, 5),
              blurRadius: 5)
        ],
      ),
      child: TextField(
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        // obscureText: true,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            focusedBorder: InputBorder.none,
            hintText: 'Email',
            border: InputBorder.none),
      ),
    );
  }
}
