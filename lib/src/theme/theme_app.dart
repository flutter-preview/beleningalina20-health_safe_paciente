import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData theme = ThemeData(
      textTheme: const TextTheme(
        // ! Puede ser removido las propiedades de este text theme por que son 2018
        // Logo - Nombre app
        headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
        // Logo - Slogan
        headline2: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
        // Labels para los text field custom
        // TextField
        subtitle1: TextStyle(fontSize: 15),
        // Text
        bodyText2: TextStyle(fontSize: 18),
        // Texto que acompaña al text button
        button: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),

        // Sin usar
        /*subtitle2: TextStyle(color: Colors.green),
        headline3: TextStyle(color: Colors.purple, fontWeight: FontWeight.w400),
        caption: TextStyle(color: Colors.purple),

        //
        headline4: TextStyle(color: Colors.pink, fontWeight: FontWeight.w400),
        headline5: TextStyle(color: Colors.purple, fontWeight: FontWeight.w400),
        headline6: TextStyle(color: Colors.red, fontWeight: FontWeight.w400),
        bodyText1: TextStyle(color: Colors.red),
        overline: TextStyle(color: Colors.red),*/
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(15),
              textStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.25)))),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
              textStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w400))),
      dialogTheme: DialogTheme(
          actionsPadding: const EdgeInsets.all(15),
          alignment: Alignment.center,
          contentTextStyle: const TextStyle(color: Colors.black, fontSize: 16),
          iconColor: Colors.blue,
          titleTextStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.25))));
}
