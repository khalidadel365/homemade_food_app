import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles{
  static var  textStyle18 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static var  textStyle14 = GoogleFonts.poppins(
  fontSize: 14,
  );
  static var  textStyle28 = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.deepOrange,
  );
  static var  textStyleBold =  GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    color: Colors.deepOrange,
  );
/*  static const  textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const  textStyle30 = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.normal,
  );
  static const  textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static const  textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );*/
}