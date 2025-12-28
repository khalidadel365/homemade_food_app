import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({required this.controller,this.validate,this.prefixIcon,this.hintText,this.onChange,this.onSubmit,this.obsecureText = false});
  final String? hintText;
  final IconData? prefixIcon;
  final bool obsecureText;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final FormFieldValidator? validate;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      validator: validate,
      onFieldSubmitted: onSubmit,
      onChanged: onChange, //input style
      cursorColor: Colors.deepOrange,
      decoration: InputDecoration(
        hintText: "$hintText",
        prefixIcon:Icon(prefixIcon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
