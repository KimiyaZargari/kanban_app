import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final Function(String?)? onSaved;
  final Function()? onTap;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final bool isLast;
  final int? maxLines, maxLength;
  final String? label;
  final bool readOnly;
  final String? Function(String?)? validator;

  const AppTextField({
    Key? key,
    this.controller,
    this.maxLines,
    this.maxLength,
    this.onTap,
    this.readOnly = false,
    this.label,
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
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 8),
            child: Text(
              '$label:',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        TextFormField(
          onTap: onTap,

          readOnly: readOnly,
          onSaved: onSaved,
          controller: controller,
          maxLines: maxLines ?? 1,
          keyboardType: textInputType,
          textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
          validator: validator,
          //style: Theme.of(context).textTheme.bodyLarge,
          maxLength: maxLength,
        ),
      ],
    );
  }
}
