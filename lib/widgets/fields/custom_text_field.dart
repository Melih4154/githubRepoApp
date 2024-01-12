import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_repo_projects/utils/styles.dart';

class CustomTextField extends HookWidget {
  const CustomTextField({
    Key? key,
    this.hintStyle,
    this.textStyle,
    required this.name,
    this.labelText,
    this.hintText,
    this.label,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.password = false,
    this.suffixIcon,
    this.inputFormatters,
    this.keyboardType,
    this.readOnly = false,
    this.textInputAction,
    this.maxLength,
    this.focusNode,
    this.controller,
    this.onSubmitted,
    this.onTap,
    this.inputBorder,
    this.contentPadding,
    this.initialValue,
    this.filled = true,
    this.fillColor,
    this.maxLines,
    this.minLines,
    this.labelStyle,
    this.cursorColor,
    this.autoFocus = false,
  }) : super(key: key);
  final bool autoFocus;
  final TextStyle? labelStyle;
  final InputBorder? inputBorder;
  final EdgeInsets? contentPadding;
  final String name;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool password;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLength;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final void Function(String?)? onSubmitted;
  final void Function()? onTap;
  final String? initialValue;
  final TextStyle? hintStyle;
  final bool filled;
  final Color? fillColor;
  final int? maxLines;
  final int? minLines;
  final Widget? label;
  final Color? cursorColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final isObscure = useState(obscureText);
    return FormBuilderTextField(
      cursorColor: cursorColor,
      onTap: onTap,
      onSubmitted: onSubmitted,
      focusNode: focusNode,
      name: name,
      initialValue: initialValue,
      readOnly: readOnly,
      controller: controller,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: isObscure.value,
      onChanged: onChanged,
      maxLength: maxLength,
      autofocus: autoFocus,
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      style: textStyle,
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        counterText: '',
        contentPadding: contentPadding,
        suffixIcon: !password
            ? suffixIcon
            : IconButton(
                onPressed: () => isObscure.value = !isObscure.value,
                icon: Icon(
                  isObscure.value ? Icons.visibility : Icons.visibility_off,
                  color: S.colors.orange.withOpacity(0.48),
                ),
              ),
        label: label,
        labelStyle: labelStyle,
        labelText: inputBorder != null ? labelText : null,
        alignLabelWithHint: true,
        hintText: inputBorder != null ? hintText : null,
        hintStyle: hintStyle ??
            TextStyle(
              color: S.colors.blue,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: S.colors.red),
        ),
        enabledBorder: inputBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: S.colors.grey.shade200),
            ),
        border: inputBorder ??
            const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
