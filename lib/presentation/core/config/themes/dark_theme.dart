import 'package:flutter/material.dart';
import 'package:kanban_app/presentation/core/config/colors.dart';

TextTheme _textTheme(TextTheme base) {
  return base.copyWith(
    titleLarge: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.darkThemeTextColor),
    titleMedium: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.darkThemeTextColor),

    titleSmall: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.darkThemeTextColor),
    displayMedium: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.darkThemeTextColor),
    labelLarge: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.darkThemeTextColor),

    labelMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: AppColors.darkThemeTextColor),

    labelSmall: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.darkThemeTextColor),
    //error texts
    displaySmall: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w300, color: AppColors.error),
    bodyLarge: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.darkThemeTextColor),

    //done body
    bodyMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.darkThemeTextColor),

    // done small body in medical records, faq answers
    bodySmall: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: AppColors.darkThemeTextColor),
  );
}

TextTheme _primaryTextTheme(TextTheme base) {
  return base.copyWith(
    bodyMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.darkThemeTextColor),
  );
}

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      scaffoldBackgroundColor: AppColors.darkBackground,
      textTheme: _textTheme(base.textTheme),
      primaryTextTheme: _primaryTextTheme(base.textTheme),
      primaryColor: AppColors.primaryColor,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.primaryColor,
        error: AppColors.error,
        tertiary: AppColors.purple,
        secondary: AppColors.secondaryColor,
      ),
      cardColor: AppColors.darkCardColor,
      menuTheme: const MenuThemeData(
          style: MenuStyle(
        elevation: MaterialStatePropertyAll<double>(10),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)))),
        backgroundColor:
            MaterialStatePropertyAll<Color>(AppColors.darkCardColor),
      )),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 1.5, color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1.5, color: AppColors.lightBackground),
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
          margin: EdgeInsets.zero,
          color: AppColors.darkCardColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        textStyle: _textTheme(base.textTheme).titleSmall,
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.darkBackground,
        elevation: 10,
        disabledBackgroundColor: Colors.grey,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        elevation: 10,
        foregroundColor: AppColors.error,
        disabledBackgroundColor: Colors.grey,
        textStyle: _textTheme(base.textTheme).titleSmall,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      )),
      iconTheme: base.iconTheme.copyWith(
        color: AppColors.darkThemeTextColor,
      ),
      floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
          backgroundColor: AppColors.primaryColor,
          elevation: 10,
          foregroundColor: AppColors.darkCardColor),
      appBarTheme: base.appBarTheme.copyWith(
          color: AppColors.darkBackground,
          centerTitle: true,
          elevation: 0,
          foregroundColor: AppColors.darkThemeTextColor),
      dialogTheme: base.dialogTheme.copyWith(
          backgroundColor: AppColors.darkCardColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          )));
}
