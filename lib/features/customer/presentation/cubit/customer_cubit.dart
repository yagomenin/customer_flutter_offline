import 'package:customer_flutter_offline/core/errors/failure.dart';
import 'package:customer_flutter_offline/features/customer/customer_string.dart';
import 'package:customer_flutter_offline/features/customer/data/model/customer.dart';
import 'package:customer_flutter_offline/features/customer/domain/usecases/delete_customer_use_case.dart';
import 'package:customer_flutter_offline/features/customer/domain/usecases/get_customer_use_case.dart';
import 'package:customer_flutter_offline/features/customer/domain/usecases/save_customer_use_case.dart';
import 'package:customer_flutter_offline/features/customer/domain/usecases/update_customer_use_case.dart';
import 'package:customer_flutter_offline/features/customer/presentation/cubit/customer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit(
    this._getCustomerUseCase,
    this._saveCustomerUseCase,
    this._updateCustomerUseCase,
    this._deleteCustomerUseCase,
  ) : super(CustomerInitialState(message: CustomerString.anyCustomerfound));

  final GetCustomerUseCase _getCustomerUseCase;
  final SaveCustomerUseCase _saveCustomerUseCase;
  final UpdateCustomerUseCase _updateCustomerUseCase;
  final DeleteCustomerUseCase _deleteCustomerUseCase;

  Future<void> fetchCustomer() async {
    emit(CustomerLoadingState());
    final result = await _getCustomerUseCase.getAllCustomer();

    await result.fold(
      (failure) {
        emit(CustomerErrorState(message: CustomerString.errorGetCustomers));
      },
      (customers) {
        if (customers.isNotEmpty) {
          emit(CustomerSuccessState(customers: customers));
        } else {
          emit(CustomerInitialState(message: CustomerString.anyCustomerfound));
        }
      },
    );
  }

  Future<void> deleteCustomer({required int id}) async {
    emit(CustomerLoadingState());
    final Either<Failure, Unit> result = await _deleteCustomerUseCase
        .deleteCustomer(id: id);

    await result.fold(
      (failure) {
        emit(CustomerDeleteErrorState(message: failure.message));
      },
      (_) {
        emit(
          CustomerDeleteSuccessState(message: 'Cliente deletado com sucesso'),
        );
      },
    );

    await fetchCustomer();
  }

  Future<void> loadForm({Customer? customer}) async {
    final Customer customerForm;
    final bool isEditing;
    if (customer != null) {
      customerForm = customer.copyWith();
      isEditing = true;
    } else {
      isEditing = false;
      customerForm = Customer();
    }
    emit(CustomerFormState(customer: customerForm, isEditing: isEditing));
  }

  Future<void> saveCustomer({
    required CustomerFormState state,
    required String name,
    required String phone,
    String? email,
  }) async {
    emit(CustomerLoadingState());
    final Customer customerToSave = state.customer.copyWith(
      name: name,
      cellphone: phone,
      email: email,
      createAt: state.isEditing ? state.customer.createAt : DateTime.now(),
      writeAt: DateTime.now(),
    );
    final Either<Failure, Unit> result;
    if (!state.isEditing) {
      result = await _saveCustomerUseCase.saveCustomer(
        customer: customerToSave,
      );
    } else {
      result = await _updateCustomerUseCase.updateCustomer(
        customer: customerToSave,
      );
    }

    await result.fold(
      (failure) {
        emit(CustomerSaveErrorState(message: failure.message));
      },
      (_) {
        emit(CustomerSaveSuccessState(message: 'Cliente salvo com sucesso'));
      },
    );

    await fetchCustomer();
  }
}
