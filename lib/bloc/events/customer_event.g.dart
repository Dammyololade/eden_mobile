// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class CustomerEvent extends Equatable {
  const CustomerEvent(this._type);

  factory CustomerEvent.fetch() = Fetch;

  factory CustomerEvent.reFresh() = ReFresh;

  factory CustomerEvent.loadMore({@required num currentPage}) = LoadMore;

  factory CustomerEvent.addCustomer({@required CustomerModel customer}) =
      AddCustomer;

  factory CustomerEvent.search({@required String searchTerm}) = Search;

  final _CustomerEvent _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(Fetch) fetch,
      @required R Function(ReFresh) reFresh,
      @required R Function(LoadMore) loadMore,
      @required R Function(AddCustomer) addCustomer,
      @required R Function(Search) search}) {
    switch (this._type) {
      case _CustomerEvent.Fetch:
        return fetch(this as Fetch);
      case _CustomerEvent.ReFresh:
        return reFresh(this as ReFresh);
      case _CustomerEvent.LoadMore:
        return loadMore(this as LoadMore);
      case _CustomerEvent.AddCustomer:
        return addCustomer(this as AddCustomer);
      case _CustomerEvent.Search:
        return search(this as Search);
    }
  }

  @override
  List get props => null;
}

@immutable
class Fetch extends CustomerEvent {
  const Fetch._() : super(_CustomerEvent.Fetch);

  factory Fetch() {
    _instance ??= Fetch._();
    return _instance;
  }

  static Fetch _instance;
}

@immutable
class ReFresh extends CustomerEvent {
  const ReFresh._() : super(_CustomerEvent.ReFresh);

  factory ReFresh() {
    _instance ??= ReFresh._();
    return _instance;
  }

  static ReFresh _instance;
}

@immutable
class LoadMore extends CustomerEvent {
  const LoadMore({@required this.currentPage}) : super(_CustomerEvent.LoadMore);

  final num currentPage;

  @override
  String toString() => 'LoadMore(currentPage:${this.currentPage})';

  @override
  List get props => [currentPage];
}

@immutable
class AddCustomer extends CustomerEvent {
  const AddCustomer({@required this.customer})
      : super(_CustomerEvent.AddCustomer);

  final CustomerModel customer;

  @override
  String toString() => 'AddCustomer(customer:${this.customer})';

  @override
  List get props => [customer];
}

@immutable
class Search extends CustomerEvent {
  const Search({@required this.searchTerm}) : super(_CustomerEvent.Search);

  final String searchTerm;

  @override
  String toString() => 'Search(searchTerm:${this.searchTerm})';

  @override
  List get props => [searchTerm];
}
