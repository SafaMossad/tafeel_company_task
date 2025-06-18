// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "hello": "هلا",
  "usersList": "قائمة المستخدمين",
  "userProfile": "ملف المستخدم",
  "personalInfo": "معلومات شخصية",
  "firstName": "الاسم الاول",
  "lastName": "الاسم الاخير",
  "email": "البريد الالكتروني"
};
static const Map<String,dynamic> _en = {
  "hello": "hello",
  "usersList": "Users List",
  "userProfile": "User Profile",
  "personalInfo": "Personal Information",
  "firstName": "First Name",
  "lastName": "Last Name",
  "email": "Email"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
