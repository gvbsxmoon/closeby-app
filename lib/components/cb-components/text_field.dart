import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CBTextField extends StatefulWidget {
  const CBTextField({
    super.key,
    this.hintText,
    this.onChanged,
    this.borderColored = true,
    this.keyboardType,
    this.controller,
    this.obscureText = false,
    this.inputFormatters = const [],
    this.validator,
  });

  final String? hintText;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool borderColored;
  final TextEditingController? controller;
  final List<TextInputFormatter> inputFormatters;
  final String? Function(String?)? validator;

  @override
  State<CBTextField> createState() => _CBTextFieldState();
}

class _CBTextFieldState extends State<CBTextField> {
  late TextEditingController controller;
  @override
  void initState() {
    if (widget.controller != null) {
      controller = widget.controller!;
    } else {
      controller = TextEditingController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.darkGrey,
      inputFormatters: widget.inputFormatters,
      controller: controller,
      validator: widget.validator,
      onChanged: (v) => setState(() {
        if (widget.onChanged != null) widget.onChanged!(v);
      }),
      style: AppFonts.figtree(fontSize: 18),
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: AppColor.offWhite,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        hintText: widget.hintText,
        enabledBorder: controller.text.isNotEmpty
            ? OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primaryBlack, width: 2),
                borderRadius: BorderRadius.circular(16),
              )
            : OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.darkGrey, width: 1),
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
        ),
      ),
    );
  }
}
