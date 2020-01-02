import 'package:eden_mobile/model/CustomerModel.dart';
import 'package:super_enum/super_enum.dart';

part 'customer_state.g.dart';

///
/// project: eden_mobile
/// @package: bloc.states
/// @author dammyololade <damola@kobo360.com>
/// created on 2020-01-02

@superEnum
enum _CustomerState {
  @object
  Initial,
  @object
  Loading,
  @generic
  @Data(fields: [DataField("customers", Generic)])
  Loaded,
  @Data(fields: [DataField("customer", CustomerModel)])
  Add,
  @Data(fields: [DataField("message", String)])
  Error
}
