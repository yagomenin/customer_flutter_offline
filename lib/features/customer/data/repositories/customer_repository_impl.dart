import 'package:customer_flutter_offline/core/errors/failure.dart';
import 'package:customer_flutter_offline/features/customer/data/model/customer.dart';
import 'package:customer_flutter_offline/features/customer/domain/repositories/customer_repository.dart';
import 'package:customer_flutter_offline/features/data/datasource/local_datasource.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CustomerRepository)
class CustomerRepositoryImpl extends CustomerRepository {
  CustomerRepositoryImpl(this._localDatasource);

  final LocalDatasource _localDatasource;

  @override
  Future<Either<Failure, List<Customer>>> getAllCustomer() async {
    try {
      final List<dynamic> result = await _localDatasource.getAll(
        tableName: Customer.tableName,
      );

      final List<Customer> customers = result
          .map((map) => Customer.fromMap(map))
          .toList();
      return Right(customers);
    } catch (e) {
      return Left(
        getDataErrorFailure(message: 'Não foi possível buscar clientes'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> saveCustomer({
    required Customer customer,
  }) async {
    try {
      await _localDatasource.insert(
        tableName: Customer.tableName,
        data: customer,
      );

      return const Right(unit);
    } catch (e) {
      return Left(
        SaveErrorFailure(message: 'Houve um erro ao salvar o cliente'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> updateCustomer({
    required Customer customer,
  }) async {
    try {
      await _localDatasource.updateById(
        tableName: Customer.tableName,
        data: customer,
        id: customer.id,
      );

      return const Right(unit);
    } catch (e) {
      return Left(
        UpdateErrorFailure(message: 'Houve um erro ao editar o cliente'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteCustomer({required int id}) async {
    try {
      await _localDatasource.deleteById(tableName: Customer.tableName, id: id);

      return const Right(unit);
    } catch (e) {
      return Left(
        UpdateErrorFailure(message: 'Houve um erro ao deletar o cliente'),
      );
    }
  }
}
