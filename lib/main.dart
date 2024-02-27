import 'dart:io';
import 'package:flutter/material.dart';
import 'package:weatherapp/services/city_helper.dart';
import 'package:weatherapp/src/app_root.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  CityHelper().getCityName();
  runApp(const AppRoot());
}
