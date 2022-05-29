
import 'package:flutter/material.dart';

IconButton buildReturnButton({required VoidCallback fun,required Widget icon}) {
  return //Icon back to screen welcome
    IconButton(
        onPressed:fun,
        icon: icon);
}