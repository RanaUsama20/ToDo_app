import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryColor = const Color(0xff5D9CEC);
  static Color backgroundLight = const Color(0xffDFECDB);
  static Color backgroundDark = const Color(0xff060E1E);
  static Color limeColor = const Color(0xff61E757);
  static Color greyColor = const Color(0xff737272);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color redColor = const Color(0xffEC4B4B);
  static Color blackColor = const Color(0xff383838);

 static ThemeData lightTheme = ThemeData(
     primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor
    ),
    textTheme: TextTheme(
      titleLarge:
        TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.w700,
          fontSize: 30
        ),
        titleMedium: TextStyle(
          color: blackColor,
          fontWeight: FontWeight.w700,
          fontSize: 25,
        ),
        titleSmall: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w400,
            fontSize: 20
        )
    ),
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
       backgroundColor: Colors.transparent,
       elevation: 0,
       selectedIconTheme: IconThemeData(
         color: primaryColor
       ),
       unselectedIconTheme: IconThemeData(
         color: greyColor
       ),
       showSelectedLabels: true,
       showUnselectedLabels: false

 ),
   floatingActionButtonTheme: FloatingActionButtonThemeData(
     backgroundColor: primaryColor
   )
  );
  static ThemeData darkTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundDark,
      appBarTheme: AppBarTheme(
          backgroundColor: primaryColor
      ),
      textTheme: TextTheme(
          titleLarge:
          TextStyle(
              color: blackColor,
              fontWeight: FontWeight.w700,
              fontSize: 30
          ),
              titleMedium: TextStyle(
                color: blackColor,
                fontWeight: FontWeight.w700,
                fontSize: 25,
      ),
        titleSmall: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w400,
          fontSize: 20
        )
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedIconTheme: IconThemeData(
              color: primaryColor
          ),
          unselectedIconTheme: IconThemeData(
              color: greyColor
          ),
          showSelectedLabels: true,
          showUnselectedLabels: false

      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor
      )
  );
}