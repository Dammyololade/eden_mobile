import 'package:eden_mobile/AppConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_tools/flutter_base_tools.dart';

///
/// project: eden_mobile
/// @package: ui.customer
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-12-25
class AddCustomer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddCustomerState();
  }

}

class _AddCustomerState extends State<AddCustomer> with BaseStatefulWidget{
  
  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var addressController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NovuWidgets.appBar("Add Customer"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                NovuWidgets.formTextField("Name", "", nameController, TextInputType.text, "please enter customer name"),
                SizedBox(height: 20,),
                NovuWidgets.formTextField("Mobile", "", mobileController, TextInputType.phone, "please enter customer mobile"),
                SizedBox(height: 20,),
                NovuWidgets.formTextField("Address", "", addressController, TextInputType.text, "please enter customer address"),
                SizedBox(height: 30,),

                NovuWidgets.progressAwareButton(notifier: progressNotifier,
                    child: NovuWidgets.positiveButton("Submit", (){

                    }, bgColor: AppConfig.APP_PRIMARY_COLOR))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {

  }

}