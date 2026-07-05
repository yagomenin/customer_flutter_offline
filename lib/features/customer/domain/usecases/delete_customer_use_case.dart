import 'package:customer_flutter_offline/core/errors/failure.dart';
import 'package:customer_flutter_offline/features/customer/domain/repositories/customer_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class DeleteCustomerUseCase {
  DeleteCustomerUseCase(this._repository);

  final CustomerRepository _repository;

  Future<Either<Failure, Unit>> deleteCustomer({required int id}) async {
    final result = await _repository.deleteCustomer(id: id);

    return result;
  }
}
