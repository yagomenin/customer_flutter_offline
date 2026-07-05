import 'package:customer_flutter_offline/core/styles/colors_app.dart';
import 'package:customer_flutter_offline/core/styles/space.dart';
import 'package:customer_flutter_offline/core/utils/date_utils.dart';
import 'package:customer_flutter_offline/core/widgets/custom_button.dart';
import 'package:customer_flutter_offline/features/customer/customer_string.dart';
import 'package:customer_flutter_offline/features/customer/data/model/customer.dart';
import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({required this.customer, super.key});

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _buildCreateAt(),
          Padding(
            padding: EdgeInsetsGeometry.all(Space.md),
            child: Column(
              mainAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: ColorsApp.generateRandomColor(
                        customer.id,
                      ),
                      child: Icon(Icons.person),
                    ),
                    const SizedBox(width: Space.sm),
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          customer.name,
                          style: TextStyle(
                            fontSize: Space.md + 4,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        _buildCellphoneText(),
                        _buildEmailText(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: ColorsApp.lowGrey),
          Row(
            children: [
              CustomButton(onPressed: () {}, textButton: CustomerString.edit),
              CustomButton(onPressed: () {}, textButton: CustomerString.delete),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCellphoneText() {
    return Text(customer.cellphone, style: _textStyleCardItem());
  }

  Widget _buildEmailText() {
    if (customer.email != null && customer.email!.isNotEmpty) {
      return Text(customer.email!, style: _textStyleCardItem());
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildCreateAt() {
    if (customer.createAt != null) {
      return Padding(
        padding: const EdgeInsets.only(top: Space.sm, right: Space.sm),
        child: Row(
          mainAxisAlignment: .end,
          children: [
            Text(CustomerString.createAt, style: _textStyleCardItem()),
            const SizedBox(width: Space.xs),
            Text(
              AppDateUtils.formatDateToDayMonthYear(date: customer.createAt!),
              style: _textStyleCardItem(),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  TextStyle _textStyleCardItem() {
    return TextStyle(fontSize: Space.md - 4, fontWeight: FontWeight.bold);
  }
}
