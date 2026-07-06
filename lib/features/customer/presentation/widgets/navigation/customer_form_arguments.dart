import 'package:customer_flutter_offline/features/customer/data/model/customer.dart';
import 'package:customer_flutter_offline/features/customer/presentation/cubit/customer_cubit.dart';

class CustomerFormArguments {
  CustomerFormArguments({required this.cubit, this.customer});

  final CustomerCubit cubit;
  final Customer? customer;
}
