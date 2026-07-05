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
  final CustomerSuccessStatus status;

  const CustomerSuccessState({required this.customers, required this.status});

  @override
  List<Object?> get props => [customers, status];
}

class CustomerErrorState extends CustomerState {
  final String message;

  const CustomerErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

enum CustomerSuccessStatus { initial, success }
