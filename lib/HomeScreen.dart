import 'package:eden_mobile/AppConfig.dart';
import 'package:eden_mobile/model/customer_bloc.dart';
import 'package:eden_mobile/ui/CustomerListScreen.dart';
import 'package:eden_mobile/ui/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

///
/// project: eden_mobile
/// @package:
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-12-25
class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedScreenIndex = 0;
  var _screens = <Widget>[];

  @override
  void initState() {
    super.initState();
    _screens = [
      MultiBlocProvider(
        providers: [
          BlocProvider<CustomerBloc>(
            create: (context) => CustomerBloc(),
          ),
        ],
        child: CustomerListScreen(),
      ),

      ProfileScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    AppConfig.setSystemChrome();

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xffF1F1F9),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people), //AppIcons.home),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), //AppIcons.home),
            title: Text(""),
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedScreenIndex = index;
          });
        },
        currentIndex: selectedScreenIndex,
      ),
      body: IndexedStack(
        index: selectedScreenIndex,
        children: _screens,
      ),
    );
  }
}
