import 'package:customer_flutter_offline/features/customer/customer_string.dart';
import 'package:customer_flutter_offline/features/customer/domain/usecases/get_customer_use_case.dart';
import 'package:customer_flutter_offline/features/customer/presentation/cubit/customer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit(this._getCustomerUseCase)
    : super(CustomerInitialState(message: CustomerString.anyCustomerfound));

  final GetCustomerUseCase _getCustomerUseCase;

  Future<void> fetchCustomer() async {
    emit(CustomerLoadingState());
    final result = await _getCustomerUseCase.getAllCustomer();

    await result.fold(
      (failure) {
        emit(CustomerErrorState(message: CustomerString.errorGetCustomers));
      },
      (customers) {
        if (customers.isNotEmpty) {
          emit(
            CustomerSuccessState(
              customers: customers,
              status: CustomerSuccessStatus.success,
            ),
          );
        } else {
          emit(CustomerInitialState(message: CustomerString.anyCustomerfound));
        }
      },
    );
  }
}
