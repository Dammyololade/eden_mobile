import 'package:eden_mobile/AppConfig.dart';
import 'package:eden_mobile/bloc/events/customer_event.dart';
import 'package:eden_mobile/bloc/states/customer_state.dart';
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
    _customerBloc.add(CustomerEvent.fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppConfig.setSystemChrome();
    return Scaffold(
      backgroundColor: Colors.white,
//      appBar: AppBar(
//        title: Text("Customers", style: TextStyle(color: Colors.black),),
//        elevation: 0,
//        backgroundColor: Colors.white,
//        centerTitle: true,
//      ),
      body: Column(
        children: <Widget>[

          Container(
            color: Color(0xffF1F1F9),
            child: Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),

              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black12.withOpacity(0.1),
                  )
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.search, color: Colors.black45,),
                  Expanded(
                      child: NovuWidgets.signUpTextField(
                          "Search Customers", _searchController)
                  )
                ],
              ),
            ),
          ),

          Expanded(
              child: BlocBuilder<CustomerBloc, CustomerState>(
                // ignore: missing_return
                  builder: (context, state) {
                    return state.when(
                        initial: (_) =>
                            Center(
                              child: CircularProgressIndicator(),
                            ),
                        loading: (_) =>
                            Center(
                              child: CircularProgressIndicator(),
                            ),
                        loaded: (state) =>
                            ListView.builder(
                                itemCount: state.customers.length,
                                itemBuilder: (context, index) {
                                  return _buildItem(state.customers[index]);
                                }
                            ),
                        add: null,
                        error: (_) =>
                            Center(
                              child: Text('failed to fetch customers'),
                            ));
                  }
              )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>
                  BlocProvider<CustomerBloc>(
                    create: (context) => _customerBloc,
                    child: AddCustomerScreen(),
                  )));
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
                backgroundColor: RandomColor().randomColor(
                    colorBrightness: ColorBrightness.dark,
                    colorSaturation: ColorSaturation.random),
                child: Text("${Utility.extractFirstLetter(model.name)}",
                  style: TextStyle(color: Colors.white),),
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