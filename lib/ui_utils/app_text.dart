import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  static Widget appText({String? text, TextStyle? textStyle, int? maxlines}) {
    return Text(
      text ?? "",
      maxLines: maxlines ?? 1,
      style: GoogleFonts.nunito(textStyle: textStyle),
    );
  }
}
