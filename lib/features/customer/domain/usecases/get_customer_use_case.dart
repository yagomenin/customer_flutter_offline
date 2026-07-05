import 'package:customer_flutter_offline/core/errors/failure.dart';
import 'package:customer_flutter_offline/features/customer/data/model/customer.dart';
import 'package:customer_flutter_offline/features/customer/domain/repositories/customer_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetCustomerUseCase {
  GetCustomerUseCase(this._repository);

  final CustomerRepository _repository;

  Future<Either<Failure, List<Customer>>> getAllCustomer() async {
    final result = _repository.getAllCustomer();

    return result;
  }
}
