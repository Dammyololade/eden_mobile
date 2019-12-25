import 'package:eden_mobile/AppConfig.dart';
import 'package:eden_mobile/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_tools/flutter_base_tools.dart';

///
/// project: eden_mobile
/// @package:
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-12-24
class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> with BaseStatefulWidget {
  var _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "images/background.jpg",
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
          Container(
            height: size.height,
            width: size.width,
            color: Colors.black54,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Card(
                  color: Colors.white.withOpacity(0.7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        Text(
                          "+234",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "ABlack",
                              color: AppConfig.APP_PRIMARY_COLOR_DARK),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 1,
                          color: AppConfig.APP_PRIMARY_COLOR.withOpacity(0.4),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _mobileController,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: NovuWidgets.progressAwareButton(
                      notifier: progressNotifier,
                      child: NovuWidgets.positiveButton(
                          "Continue With Mobile", () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                          bgColor: AppConfig.APP_PRIMARY_COLOR,
                          padding: EdgeInsets.symmetric(vertical: 20),
                        textColor: Colors.white
                      )),
                ),
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                              "By inputing your phone & signing up you agree to our terms of service & privacy policy",
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "ABook",
                              color: Colors.white38
                            ),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
