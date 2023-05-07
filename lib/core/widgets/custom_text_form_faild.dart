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
     this.validator,
     this.onSaved,
    this.textInputType,
  });
  final Widget? prefixIcon;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
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
            color: kDividerColor,
            fontSize: 15,
            fontWeight: FontWeight.w600,
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
        borderSide: BorderSide(color: kTextFormFieldBorder));
  }
}
