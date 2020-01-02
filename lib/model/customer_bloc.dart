import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eden_mobile/bloc/events/customer_event.dart';
import 'package:eden_mobile/bloc/states/customer_state.dart';
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
  List<CustomerModel> customerList = [];

  @override
  CustomerState get initialState => CustomerState.initial();

  @override
  Stream<CustomerState> transformEvents(Stream<CustomerEvent> events,
      Stream<CustomerState> Function(CustomerEvent event) next) {
    return super.transformEvents(events, next);
  }

  @override
  Stream<CustomerState> mapEventToState(CustomerEvent event) async* {
    final currentState = state;
    try {
      yield CustomerState.loading();
      yield* event.when(
          fetch: (e) async* {
            var customers = await fetchCustomers();
            customerList.addAll(customers);
            yield CustomerState.loaded(customers: customers);
          },
          reFresh: null,
          loadMore: null,
          addCustomer: (e) async* {
            var result = await firestore.collection("customers").add(
                e.customer.toMap());
            customerList.add(CustomerModel.fromSnapshot(await result.get()));
            yield CustomerState.loaded(customers: customerList);
          },
          search: null);
    } catch (error) {
      yield CustomerState.error(message: error.toString());
    }
  }

  Future<List<CustomerModel>> fetchCustomers() async {
    List<CustomerModel> customers = [];
    try {
      var response = await firestore.collection("customers").getDocuments();
      response.documents.forEach((snapshot) {
        customers.add(CustomerModel.fromSnapshot(snapshot));
      });
      return customers;
    } catch (error) {
      print("an error has occured while loading the data");
    }
  }
}