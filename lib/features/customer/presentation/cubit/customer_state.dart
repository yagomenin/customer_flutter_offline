import 'package:customer_flutter_offline/features/customer/data/model/customer.dart';
import 'package:equatable/equatable.dart';

abstract class CustomerState extends Equatable {
  const CustomerState();

  @override
  List<Object?> get props => [];
}

class CustomerInitialState extends CustomerState {
  const CustomerInitialState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

class CustomerLoadingState extends CustomerState {}

class CustomerSuccessState extends CustomerState {
  final List<Customer> customers;

  const CustomerSuccessState({required this.customers});

  @override
  List<Object?> get props => [customers];
}

class CustomerErrorState extends CustomerState {
  final String message;

  const CustomerErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class CustomerFormState extends CustomerState {
  final Customer customer;
  final bool isEditing;

  const CustomerFormState({required this.customer, required this.isEditing});

  CustomerFormState copyWith({Customer? customer, bool? isEditing}) {
    return CustomerFormState(
      customer: customer ?? this.customer,
      isEditing: isEditing ?? this.isEditing,
    );
  }

  @override
  List<Object?> get props => [customer];
}

class CustomerSaveSuccessState extends CustomerState {
  final String message;

  const CustomerSaveSuccessState({required this.message});

  @override
  List<Object?> get props => [message];
}

class CustomerSaveErrorState extends CustomerState {
  final String message;

  const CustomerSaveErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class CustomerDeleteSuccessState extends CustomerState {
  final String message;

  const CustomerDeleteSuccessState({required this.message});

  @override
  List<Object?> get props => [message];
}

class CustomerDeleteErrorState extends CustomerState {
  final String message;

  const CustomerDeleteErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
