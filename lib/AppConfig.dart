import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
/// project: eden_mobile
/// @package: 
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-12-25
class AppConfig {

  static const APP_ACCENT_COLOR = Color(0xFFA16879);
  static final Color APP_PRIMARY_COLOR_DARK = Color(0xff543B58);
  static final Color APP_PRIMARY_COLOR = Color(0xFF604361);

  static final firestore = Firestore.instance;

  static final customerColRef = firestore.collection("customers");

  static setSystemChrome() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xffF1F1F9),
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppConfig.APP_PRIMARY_COLOR_DARK,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light
    ));
  }
}