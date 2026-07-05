import 'package:customer_flutter_offline/core/errors/failure.dart';
import 'package:customer_flutter_offline/features/customer/data/model/customer.dart';
import 'package:fpdart/fpdart.dart';

abstract class CustomerRepository {
  Future<Either<Failure, List<Customer>>> getAllCustomer();

  Future<Either<Failure, Unit>> saveCustomer({required Customer customer});

  Future<Either<Failure, Unit>> updateCustomer({required Customer customer});

  Future<Either<Failure, Unit>> deleteCustomer({required int id});
}
