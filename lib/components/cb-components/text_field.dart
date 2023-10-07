import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CBTextField extends StatefulWidget {
  const CBTextField({
    super.key,
    this.initialValue,
    this.hintText,
    this.onChanged,
    this.borderColored = true,
    this.keyboardType,
    this.focusNode,
    this.obscureText = false,
    this.showPassword,
    this.showEye = false,
    this.inputFormatters = const [],
    this.validator,
  });

  final String? hintText;
  final String? initialValue;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool obscureText;
  final Function()? showPassword;
  final bool showEye;
  final bool borderColored;
  final List<TextInputFormatter> inputFormatters;
  final String? Function(String?)? validator;

  @override
  State<CBTextField> createState() => _CBTextFieldState();
}

class _CBTextFieldState extends State<CBTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      cursorColor: AppColor.darkGrey,
      inputFormatters: widget.inputFormatters,
      focusNode: widget.focusNode,
      validator: widget.validator,
      onChanged: (v) => setState(() {
        if (widget.onChanged != null) widget.onChanged!(v);
      }),
      style: AppFonts.figtree(),
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        suffixIcon: widget.showEye
            ? GestureDetector(
                onTap: widget.showPassword,
                child: Icon(
                  widget.obscureText
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  color: AppColor.darkGrey,
                ),
              )
            : null,
        isDense: true,
        filled: true,
        fillColor: AppColor.offWhite,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.lightGrey, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.salmonPink, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryBlack, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryBlack, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.salmonPink, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        errorMaxLines: 1,
        errorStyle: AppFonts.figtree(
          color: AppColor.salmonPink,
          fontSize: 12,
        ),
        hintStyle: AppFonts.figtree(
          color: AppColor.secondaryBlack,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
