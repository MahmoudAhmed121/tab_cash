import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_cach/constant.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: kBackGroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }
}
