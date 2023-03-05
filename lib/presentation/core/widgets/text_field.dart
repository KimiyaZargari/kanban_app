import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final Function(String?)? onSaved;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final bool isLast;
  final int? maxLines, maxLength;
  final String label;
  final String? Function(String?)? validator;

  const AppTextField({
    Key? key,
    this.controller,
    this.maxLines,
    this.maxLength,
    required this.label,
    this.onSaved,
    this.isLast = false,
    this.textInputType = TextInputType.text,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4, left: 8),
          child: Text(
            'Project Name',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        TextFormField(
          onSaved: onSaved,
          controller: controller,
          maxLines: maxLines ?? 1,
          keyboardType: textInputType,
          textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
          validator: validator,
          //style: Theme.of(context).textTheme.bodyLarge,
          maxLength: maxLength,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1.5, color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),

            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1.5, color: Theme.of(context).dividerColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(),
            disabledBorder: OutlineInputBorder(),

            // _border,
            //  fillColor: Theme.of(context).primaryColorDark,
            //filled: true,
            errorMaxLines: 2,
            focusColor: Theme.of(context).secondaryHeaderColor,
            hoverColor: Theme.of(context).secondaryHeaderColor,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          ),
        ),
      ],
    );
  }
}
