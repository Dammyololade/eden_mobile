import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_base_tools/flutter_base_tools.dart';

///
/// project: eden_mobile
/// @package: model
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-12-25
class CustomerModel extends BaseModel{

  static String cName = "name";
  static String cMobile = "mobile";
  static String cAddress = "address";

  String name, address, mobile;

  @override
  createObjectFromMap(Map data) {
    return null;
  }

  CustomerModel.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot.data[cName];
    address = snapshot.data[cAddress];
    mobile = snapshot.data[cMobile];
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      cName: name,
      cAddress: address,
      cMobile: mobile
    };
  }
}