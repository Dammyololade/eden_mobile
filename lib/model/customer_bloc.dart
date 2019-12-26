import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eden_mobile/model/CustomerModel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///
/// project: eden_mobile
/// @package: model
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-12-25
class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {

  var firestore = Firestore.instance;

  @override
  CustomerState get initialState => CustomerUninitialized();

  @override
  Stream<CustomerState> transformEvents(Stream<CustomerEvent> events, Stream<CustomerState> Function(CustomerEvent event) next) {
    return super.transformEvents(events, next);
  }

  @override
  Stream<CustomerState> mapEventToState(CustomerEvent event) async*{
    final currentState = state;
    try {
      if(currentState is CustomerUninitialized) {
        var customers = await fetchCustomers();
        yield CustomerLoaded(customers: customers);
        return;
      } else if (currentState is AddCustomer) {
        var result = await firestore.collection("customers").add(
            currentState.customerModel.toMap());
        this.add(Fetch());
      }

    } catch (error) {
      yield CustomerError();
    }
  }

  Future<List<CustomerModel>> fetchCustomers() async{
    List<CustomerModel> customers = [];
    try {
      var response = await firestore.collection("customers").getDocuments();
      response.documents.forEach((snapshot){
        customers.add(CustomerModel.fromSnapshot(snapshot));
      });
      return customers;
    } catch (error) {
      print("an error has occured while loading the data");
    }
  }
}

abstract class CustomerEvent {}

class Fetch extends CustomerEvent {}

abstract class CustomerState {
  const CustomerState();
}

class CustomerUninitialized extends CustomerState {}


class AddCustomer extends CustomerState {
  CustomerModel customerModel;

  AddCustomer(this.customerModel);

}

class CustomerError extends CustomerState {}

class CustomerLoaded extends CustomerState {
  final List<CustomerModel> customers;

  CustomerLoaded({this.customers});

  CustomerLoaded.copyWith({this.customers}) {
     CustomerLoaded(customers: customers);
  }
}