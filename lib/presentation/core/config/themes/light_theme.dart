import 'package:flutter/material.dart';
import 'package:kanban_app/presentation/core/config/colors.dart';

TextTheme _textTheme(TextTheme base) {
  return base.copyWith(
    titleLarge: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.lightThemeTextColor),
    titleMedium: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.lightThemeTextColor),

    titleSmall: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.lightThemeTextColor),

    labelLarge: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.lightThemeTextColor),

    labelMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: AppColors.lightThemeTextColor),

    labelSmall: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.lightThemeTextColor),
    //error texts
    displaySmall: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.error),
    bodyLarge: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.lightThemeTextColor),

    //done body
    bodyMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.lightThemeTextColor),

    // done small body in medical records, faq answers
    bodySmall: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: AppColors.lightThemeTextColor),
  );
}

TextTheme _primaryTextTheme(TextTheme base) {
  return base.copyWith(
    bodyMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.lightThemeTextColor),
  );
}

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      scaffoldBackgroundColor: AppColors.lightBackground,
      textTheme: _textTheme(base.textTheme),
      primaryTextTheme: _primaryTextTheme(base.textTheme),
      primaryColor: AppColors.primaryColor,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.primaryColor,
        error: AppColors.error,
        tertiary: AppColors.error,
        secondary: AppColors.secondaryColor,
      ),
      cardColor: AppColors.lightCardColor,
      menuTheme: const MenuThemeData(
          style: MenuStyle(
        elevation: MaterialStatePropertyAll<double>(10),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)))),
        backgroundColor:
            MaterialStatePropertyAll<Color>(AppColors.lightCardColor),
      )),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        errorStyle: _textTheme(base.textTheme).displaySmall,
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 1.5, color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 1.5, color: AppColors.darkBackground),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: AppColors.error),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.5, color: AppColors.error),
            borderRadius: BorderRadius.circular(10)),
        disabledBorder: OutlineInputBorder(),
        errorMaxLines: 2,
        contentPadding: const EdgeInsets.all(16),
      ),
      checkboxTheme: base.checkboxTheme.copyWith(
          fillColor:
              const MaterialStatePropertyAll<Color>(AppColors.primaryColor),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)))),
      //  focusColor: Colors.deepPurpleAccent,
      cardTheme: base.cardTheme.copyWith(
          elevation: 10,
          color: AppColors.lightCardColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        textStyle: _textTheme(base.textTheme).labelLarge,
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.lightBackground,
        elevation: 10,
        disabledBackgroundColor: Colors.grey,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        elevation: 0,
        foregroundColor: AppColors.lightThemeTextColor,
        disabledBackgroundColor: Colors.grey,
        textStyle: _textTheme(base.textTheme).labelLarge,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      )),
      iconTheme: base.iconTheme.copyWith(
        color: AppColors.lightThemeTextColor,
      ),
      floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
          backgroundColor: AppColors.primaryColor,
          elevation: 10,
          foregroundColor: AppColors.lightBackground),
      appBarTheme: base.appBarTheme.copyWith(
          color: AppColors.lightBackground,
          centerTitle: true,
          elevation: 0,
          foregroundColor: AppColors.lightThemeTextColor),
      dialogTheme: base.dialogTheme.copyWith(
          backgroundColor: AppColors.lightBackground,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          )));
}
