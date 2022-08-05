import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Builder TextForm(
    {required FormFieldValidator<String>? validator,
    required TextEditingController controller,
    required TextInputType? keyboardType,
    required String labelText,
    required IconData icon,
    bool obscureText = false,
    required bool prefixIcon,
    required String hintText}) {
  return Builder(builder: (context) {
    return TextFormField(
      controller: controller,
      cursorColor: Theme.of(context).primaryColor,
      obscureText: obscureText,
      onSaved: (newValue) {
        controller.text = newValue!;
      },
      validator: validator,
      keyboardType: keyboardType,
      style: TextStyle(
          color: Theme.of(context).textTheme.bodyText2!.color),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        // ignore: unnecessary_null_comparison
        prefixIcon: Builder(builder: (context) {
          return Icon(
            icon,
            color: Theme.of(context).iconTheme.color,
          );
        }),
        // ignore: unnecessary_null_comparison
        suffixIcon: prefixIcon == true
            ? IconButton(
                onPressed: () {
                  obscureText = !obscureText;
                },
                icon:obscureText==false ?const Icon(Icons.visibility):const Icon(Icons.visibility_off_outlined))
            : null,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedBorder:Theme.of(context).inputDecorationTheme.focusedBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        focusedErrorBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
      ),
    );
  });
}

bool isPasswordCompliant(String password, [int minLength = 6]) {
  if (password.isEmpty) {
    return false;
  }

  bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
  bool hasDigits = password.contains(RegExp(r'[0-9]'));
  bool hasLowercase = password.contains(RegExp(r'[a-z]'));
  bool hasSpecialCharacters =
      password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasMinLength = password.length >= minLength;

  return (hasDigits || hasUppercase || hasLowercase || hasSpecialCharacters) &&
      hasMinLength;
}
