import 'package:flutter/material.dart';

class MyText {
  static Text drawText(
      {String content = "",
      double fontSize = 12,
      Color fontColor = Colors.black26,
      bool bold = false,
      bool centered = false,
      TextOverflow overflow = TextOverflow.clip,
      int maxLines = 20,
      String fontFamily = 'The-Sans-Plain'}) {
    return Text(
      content,
      maxLines: maxLines,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontFamily: "The-Sans-Plain",
        fontWeight: bold ? FontWeight.bold : FontWeight.w400,
        overflow: overflow,
      ),
      textAlign: centered ? TextAlign.center : TextAlign.start,
    );
  }
}
