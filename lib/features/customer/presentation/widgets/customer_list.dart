import 'package:customer_flutter_offline/features/customer/data/model/customer.dart';
import 'package:customer_flutter_offline/features/customer/presentation/cubit/customer_cubit.dart';
import 'package:customer_flutter_offline/features/customer/presentation/widgets/customer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({required this.customers, super.key});

  final List<Customer> customers;

  @override
  Widget build(BuildContext context) {
    final CustomerCubit cubit = context.read<CustomerCubit>();
    if (customers.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: customers.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final Customer customer = customers[index];
          return CustomerCard(customer: customer, cubit: cubit);
        },
      );
    } else {
      return Center(
        child: Text('Nenhum cliente com essas informacoes foi encontrado'),
      );
    }
  }
}
