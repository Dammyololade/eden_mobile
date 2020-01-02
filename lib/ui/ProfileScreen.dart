import 'package:eden_mobile/AppConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_tools/flutter_base_tools.dart';

/// 
/// project: eden_mobile
/// @package: ui
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-12-25
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppConfig.setSystemChrome();
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Profile", style: TextStyle(color: Colors.black),),
//        elevation: 0,
//        backgroundColor: Colors.white,
//        centerTitle: true,
//      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Profile will be here")
          ],
        ),
      ),
    );
  }

}