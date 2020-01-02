import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:eden_mobile/AppConfig.dart';
import 'package:eden_mobile/bloc/events/customer_event.dart';
import 'package:eden_mobile/model/CustomerModel.dart';
import 'package:eden_mobile/model/customer_bloc.dart';
import 'package:eden_mobile/ui/PhoneContactScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_tools/flutter_base_tools.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:random_color/random_color.dart';

///
/// project: eden_mobile
/// @package: ui.customer
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-12-25
class AddCustomerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddCustomerScreenState();
  }
}

class _AddCustomerScreenState extends State<AddCustomerScreen>
    with BaseStatefulWidget {
  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var addressController = TextEditingController();
  ValueNotifier<bool> addContactLocally = ValueNotifier(false);
  var formKey = GlobalKey<FormState>();
  Contact _contact;
  List<Contact> _contactList = [];

  @override
  Widget build(BuildContext context) {
    AppConfig.setSystemChrome();
    return Scaffold(
      appBar: NovuWidgets.appBar("Add Customer", actions: [
        IconButton(
            icon: Icon(Icons.contacts),
            onPressed: () async {
              _contact = await navigateTo(context, PhoneContactScreen());
              if (_contact != null) {
                addContactLocally.value = false;
                nameController.text = _contact.displayName;
                mobileController.text = _contact.phones
                    .toList()
                    .isNotEmpty
                    ? _contact.phones.toList()[0].value
                    : "";
              }
            })
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                NovuWidgets.formTextField("Name", "", nameController,
                    TextInputType.text, "please enter customer name"),
                SizedBox(
                  height: 20,
                ),
                NovuWidgets.formTextField("Mobile", "", mobileController,
                    TextInputType.phone, "please enter customer mobile"),
                SizedBox(
                  height: 20,
                ),
                NovuWidgets.formTextField("Address", "", addressController,
                    TextInputType.text, "please enter customer address"),


                if(_contact == null) Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: <Widget>[
                      Text("Add to Phone contact?",
                        style: TextStyle(fontFamily: "ABook", color: AppConfig
                            .APP_PRIMARY_COLOR),
                      ),
                      SizedBox(width: 10,),
                      ValueListenableBuilder(valueListenable: addContactLocally,
                          builder: (context, bool value, child) =>
                              Checkbox(
                                  value: value,
                                  onChanged: (bool newValue) =>
                                  addContactLocally.value = newValue))

                    ],
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                NovuWidgets.progressAwareButton(
                    notifier: progressNotifier,
                    child: NovuWidgets.positiveButton("Submit", _submit,
                        bgColor: AppConfig.APP_PRIMARY_COLOR))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() async {
    if (nameController.text.isNotEmpty) {
      CustomerModel model = CustomerModel(name: nameController.text,
          mobile: mobileController.text,
          address: addressController.text);
      progressNotifier.value = true;
      await AppConfig.customerColRef.add(model.toMap());
      var bloc = BlocProvider.of<CustomerBloc>(context);
      bloc.add(CustomerEvent.fetch());
      bloc.close();
      progressNotifier.value = false;
      Navigator.of(context).pop();
    } else {
      showBottomNotification(
          context, message: "please enter the customer's name");
    }
  }
}
