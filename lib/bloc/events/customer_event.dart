import 'package:eden_mobile/model/CustomerModel.dart';
import 'package:super_enum/super_enum.dart';

part 'customer_event.g.dart';

///
/// project: eden_mobile
/// @package: bloc.events
/// @author dammyololade <damola@kobo360.com>
/// created on 2020-01-02

@superEnum
enum _CustomerEvent {
  @object
  Fetch,
  @object
  ReFresh,
  @Data(fields: [DataField("currentPage", num)])
  LoadMore,
  @Data(fields: [DataField("customer", CustomerModel)])
  AddCustomer,
  @Data(fields: [DataField("searchTerm", String)])
  Search
}
