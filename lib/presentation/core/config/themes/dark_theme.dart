import 'package:flutter/material.dart';
import 'package:kanban_app/presentation/core/config/colors.dart';

TextTheme _textTheme(TextTheme base) {
  return base.copyWith(
    titleLarge: const TextStyle(
        fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
    titleMedium: const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),

    titleSmall: const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),

    labelLarge: const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),

    labelMedium: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),

    labelSmall: const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
    //error texts
    displaySmall: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w300, color: AppColors.error),
    bodyLarge: const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),

    //done body
    bodyMedium: const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),

    // done small body in medical records, faq answers
    bodySmall: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white),
  );
}

TextTheme _primaryTextTheme(TextTheme base) {
  return base.copyWith(
    bodyMedium: const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
  );
}

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      scaffoldBackgroundColor: AppColors.darkBackground,
      textTheme: _textTheme(base.textTheme),
      primaryTextTheme: _primaryTextTheme(base.textTheme),
      primaryColorDark: Colors.deepPurple,
      primaryColor: AppColors.primaryColor,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.primaryColor,
        error: AppColors.error,
      ),
      //  focusColor: Colors.deepPurpleAccent,
      cardTheme: base.cardTheme.copyWith(
          elevation: 0,
          color: AppColors.darkCardColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        textStyle: _textTheme(base.textTheme).labelLarge,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        disabledBackgroundColor: Colors.grey,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        elevation: 0,
        foregroundColor: AppColors.primaryColor,
        disabledBackgroundColor: Colors.grey,
        textStyle: _textTheme(base.textTheme).labelLarge,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      )),
      iconTheme: base.iconTheme.copyWith(
        color: Colors.white,
      ),
      floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          foregroundColor: AppColors.darkCardColor),
      appBarTheme: base.appBarTheme.copyWith(
          color: AppColors.primaryColor,
          centerTitle: true,
          elevation: 0,
          foregroundColor: AppColors.darkCardColor),
      dialogTheme: base.dialogTheme.copyWith(
          backgroundColor: AppColors.darkCardColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          )));
}
