import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/constant.dart';

class CustomTextFormFaild extends StatelessWidget {
  CustomTextFormFaild({
    super.key,
    required this.hintText,
    this.prefixIcon,
    required this.obscureText,
    this.suffixIcon,
    this.textEditingController,
    required this.validator,
    this.textInputType,
  });
  final Widget? prefixIcon;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: textEditingController,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: GoogleFonts.inter(
            color: kDescriptionText,
            fontSize: 16,
          ),
          focusedBorder: focusborder(),
          border: border(),
          enabledBorder: border()),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: kDividerColor));
  }

  OutlineInputBorder focusborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: kButtomColor));
  }
}
