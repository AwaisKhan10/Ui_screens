import 'package:flutter/material.dart';
import 'package:zarafa_app/constants/colors.dart';
import 'package:zarafa_app/constants/text_style.dart';

final authFieldDecoration = InputDecoration(
  hintText: "",
  hintStyle:
      style18.copyWith(color: hintTextColor, fontWeight: FontWeight.normal),
  focusColor: whiteColor,
  prefixIconColor: searchIconColor,
  suffixIconColor: searchIconColor,
  fillColor: whiteColor,
  filled: true,
  border: InputBorder.none,
  contentPadding: const EdgeInsets.all(15),
  enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: borderColor, width: 1.0),
      borderRadius: BorderRadius.circular(15)),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: borderColor, width: 1.0),
      borderRadius: BorderRadius.circular(15)),
  errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: borderColor, width: 1.0),
      borderRadius: BorderRadius.circular(15)),
  disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: borderColor, width: 1.0),
      borderRadius: BorderRadius.circular(15)),
  focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: borderColor, width: 1.0),
      borderRadius: BorderRadius.circular(15)),
);
