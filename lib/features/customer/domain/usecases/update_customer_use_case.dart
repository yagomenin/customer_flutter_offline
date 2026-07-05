import 'package:customer_flutter_offline/core/errors/failure.dart';
import 'package:customer_flutter_offline/features/customer/data/model/customer.dart';
import 'package:customer_flutter_offline/features/customer/domain/repositories/customer_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class UpdateCustomerUseCase {
  UpdateCustomerUseCase(this._repository);

  final CustomerRepository _repository;

  Future<Either<Failure, Unit>> updateCustomer({
    required Customer customer,
  }) async {
    final result = await _repository.updateCustomer(customer: customer);

    return result;
  }
}
