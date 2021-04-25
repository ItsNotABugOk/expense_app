import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.purple,
      primarySwatch: Colors.purple,
      scaffoldBackgroundColor: Colors.white,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.purpleAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      buttonColor: Colors.black,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      textTheme: ThemeData.dark().textTheme,
      primaryColor: Colors.purple,
      primarySwatch: Colors.purple,
      primaryColorDark: Colors.purple,
      cardColor: Color.fromRGBO(79, 70, 82, 1),
      backgroundColor: Colors.black12,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Color.fromRGBO(79, 70, 82, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color.fromRGBO(79, 70, 82, .7),
        foregroundColor: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.black,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.purpleAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      buttonColor: Colors.black,
    );
  }
}
