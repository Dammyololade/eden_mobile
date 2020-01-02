// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class CustomerState<T> extends Equatable {
  const CustomerState(this._type);

  factory CustomerState.initial() = Initial<T>;

  factory CustomerState.loading() = Loading<T>;

  factory CustomerState.loaded({@required T customers}) = Loaded<T>;

  factory CustomerState.add({@required CustomerModel customer}) = Add<T>;

  factory CustomerState.error({@required String message}) = Error<T>;

  final _CustomerState _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(Initial) initial,
      @required R Function(Loading) loading,
      @required R Function(Loaded) loaded,
      @required R Function(Add) add,
      @required R Function(Error) error}) {
    switch (this._type) {
      case _CustomerState.Initial:
        return initial(this as Initial);
      case _CustomerState.Loading:
        return loading(this as Loading);
      case _CustomerState.Loaded:
        return loaded(this as Loaded);
      case _CustomerState.Add:
        return add(this as Add);
      case _CustomerState.Error:
        return error(this as Error);
    }
  }

  @override
  List get props => null;
}

@immutable
class Initial<T> extends CustomerState<T> {
  const Initial._() : super(_CustomerState.Initial);

  factory Initial() {
    _instance ??= Initial._();
    return _instance;
  }

  static Initial _instance;
}

@immutable
class Loading<T> extends CustomerState<T> {
  const Loading._() : super(_CustomerState.Loading);

  factory Loading() {
    _instance ??= Loading._();
    return _instance;
  }

  static Loading _instance;
}

@immutable
class Loaded<T> extends CustomerState<T> {
  const Loaded({@required this.customers}) : super(_CustomerState.Loaded);

  final T customers;

  @override
  String toString() => 'Loaded(customers:${this.customers})';
  @override
  List get props => [customers];
}

@immutable
class Add<T> extends CustomerState<T> {
  const Add({@required this.customer}) : super(_CustomerState.Add);

  final CustomerModel customer;

  @override
  String toString() => 'Add(customer:${this.customer})';
  @override
  List get props => [customer];
}

@immutable
class Error<T> extends CustomerState<T> {
  const Error({@required this.message}) : super(_CustomerState.Error);

  final String message;

  @override
  String toString() => 'Error(message:${this.message})';
  @override
  List get props => [message];
}
