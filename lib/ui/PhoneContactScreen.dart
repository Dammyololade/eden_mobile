import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_tools/flutter_base_tools.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:random_color/random_color.dart';

///
/// project: eden_mobile
/// @package: ui
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-12-25
class PhoneContactScreen extends StatefulWidget {
  @override
  _PhoneContactScreenState createState() => _PhoneContactScreenState();
}

class _PhoneContactScreenState extends State<PhoneContactScreen> {
  bool loading = true;

  List<Contact> _contactList = [];

  @override
  void initState() {
    _importContact();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NovuWidgets.appBar("Select Contact"),
        body: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _contactList.length,
                itemBuilder: (context, index) =>
                    _buildItem(_contactList[index])));
  }

  Widget _buildItem(Contact model) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).pop(model);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 25,
                  backgroundColor: RandomColor().randomColor(
                      colorBrightness: ColorBrightness.dark,
                      colorSaturation: ColorSaturation.random),
                  child: Text(
                    "${Utility.extractFirstLetter(model.displayName)}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          "${model.displayName}",
                          style: TextStyle(
                            fontFamily: "AHeavy",
                          ),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "${model.phones.toList().isNotEmpty ? model.phones.toList()[0].value : "N/A"}",
                      style: TextStyle(fontFamily: "ARoman", fontSize: 13),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
        NovuWidgets.divider(color: Colors.black12),
      ],
    );
  }

  void _importContact() async {
    var response = await PermissionHandler()
        .requestPermissions([PermissionGroup.contacts]);
    var contacts = await ContactsService.getContacts();
    loading = false;
    if (contacts.isNotEmpty) {
      setState(() {
        _contactList = contacts.toList();
      });
    }
  }
}
