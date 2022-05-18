import 'package:flutter/material.dart';
import 'package:machine_test/core/const/constants.dart';

class CustomFormField extends StatelessWidget {
  final Widget? prefix;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType? inputType;
  const CustomFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.inputType,
    this.validator,
    this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      style: Constants.textStyle1(context),
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.red, fontSize: 11),
        prefixIcon: prefix,
        filled: true,
        hintText: hintText,
        hintStyle: Constants.textStyle1(context),
        fillColor: Constants.primaryColor,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
