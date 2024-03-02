import 'package:flutter/material.dart';

newCustomMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: const TextStyle(
          overflow: TextOverflow.clip,
          height: 1,
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      duration: const Duration(milliseconds: 2000),
      backgroundColor: const Color(0xffFFD234),
    ));
}
