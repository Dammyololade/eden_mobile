import 'package:eden_mobile/AppConfig.dart';
import 'package:eden_mobile/model/CustomerModel.dart';
import 'package:eden_mobile/model/customer_bloc.dart';
import 'package:eden_mobile/ui/customer/AddCustomer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_tools/flutter_base_tools.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_color/random_color.dart';

///
/// project: eden_mobile
/// @package: ui
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-12-25
class CustomerListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomerListScreenState();
  }

}

class _CustomerListScreenState extends State<CustomerListScreen> {

  var _searchController = TextEditingController();
  CustomerBloc _customerBloc;

  @override
  void initState() {
    _customerBloc = BlocProvider.of<CustomerBloc>(context);
    _customerBloc.add(Fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppConfig.APP_PRIMARY_COLOR_DARK
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Customers", style: TextStyle(color: Colors.black),),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[

          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            color: Color(0xfff8f8f8),
            child: Row(
              children: <Widget>[
                Icon(Icons.search, color: Colors.black45,),
                SizedBox(width: 5,),
                Expanded(
                    child: NovuWidgets.signUpTextField(
                        "Search", _searchController)
                )
              ],
            ),
          ),

          Expanded(
              child: BlocBuilder<CustomerBloc, CustomerState>(
                // ignore: missing_return
                  builder: (context, state) {
                    if (state is CustomerUninitialized) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is CustomerError) {
                      return Center(
                        child: Text('failed to fetch customers'),
                      );
                    }
                    if (state is CustomerLoaded) {
                      if (state.customers.isEmpty) {
                        return Center(
                          child: Text('no customer'),
                        );
                      }
                      return ListView.builder(
                          itemCount: state.customers.length,
                          itemBuilder: (context, index) {
                            return _buildItem(state.customers[index]);
                          }
                      );
                    }
                  }
              )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddCustomerScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildItem(CustomerModel model) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 25,
                backgroundColor: RandomColor().randomColor(colorBrightness: ColorBrightness.dark, colorSaturation: ColorSaturation.random),
                child: Text("${Utility.extractFirstLetter(model.name)}", style: TextStyle(color: Colors.white),),
              ),
              SizedBox(width: 15,),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: Text("${model.name}",
                        style: TextStyle(
                          fontFamily: "AHeavy",
                        ),
                      ))
                    ],
                  ),
                  SizedBox(height: 3,),
                  Text("${model.mobile}",
                    style: TextStyle(
                      fontFamily: "ARoman",
                      fontSize: 13
                    ),
                  ),
//                  SizedBox(height: 3,),
//                  Row(
//                    children: <Widget>[
//                      Expanded(child: Text("${model.address}",
//                        style: TextStyle(
//                          fontFamily: "ARoman",
//                          fontSize: 12
//                        ),
//                      ))
//                    ],
//                  ),
                ],
              ))
            ],
          ),
        ),
        NovuWidgets.divider(color: Colors.black12),
      ],
    );
  }
}