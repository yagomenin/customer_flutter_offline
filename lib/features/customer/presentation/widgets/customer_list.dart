import 'package:customer_flutter_offline/features/customer/data/model/customer.dart';
import 'package:customer_flutter_offline/features/customer/presentation/widgets/customer_card.dart';
import 'package:flutter/material.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({required this.customers, super.key});

  final List<Customer> customers;

  @override
  Widget build(BuildContext context) {
    if (customers.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: customers.length,
        itemBuilder: (BuildContext context, int index) {
          final Customer customer = customers[index];
          return CustomerCard(customer: customer);
        },
      );
    } else {
      return Center(
        child: Text('Nenhum cliente com essas informacoes foi encontrado'),
      );
    }
  }
}
