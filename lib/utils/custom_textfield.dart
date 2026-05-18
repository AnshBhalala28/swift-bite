import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swiftbite/utils/cutomColor.dart';
import 'package:swiftbite/utils/import_string.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool showLabel;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.showLabel = true,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.showLabel && widget.label.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 6),
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: CustomFonts.bold,
                color: CustomColors.lableText,
              ),
            ),
          ),

        SizedBox(
          height: 5.8.h,
          child: TextFormField(
            controller: widget.controller,
            onChanged: widget.onChanged,
            obscureText: widget.isPassword ? _obscureText : false,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            style: TextStyle(
              fontSize: 14.sp,
              color: CustomColors.lableText,
              fontFamily: CustomFonts.reguler,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontSize: 13.sp,
                color: CustomColors.subLableText,
                fontFamily: CustomFonts.semiBold,
              ),
              prefixIcon: Icon(
                widget.prefixIcon,
                color: CustomColors.orange,
                size: 18.sp,
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: CustomColors.subLableText,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
                  : null,
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 4.w,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: CustomColors.orange),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: CustomColors.orange),
              ),
            ),
          ),
        ),
      ],
    );
  }
}