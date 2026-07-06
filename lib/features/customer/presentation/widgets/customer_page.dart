import 'dart:async';

import 'package:customer_flutter_offline/core/styles/colors_app.dart';
import 'package:customer_flutter_offline/core/styles/space.dart';
import 'package:customer_flutter_offline/core/widgets/custom_app_bar.dart';
import 'package:customer_flutter_offline/core/widgets/custom_bottom_bar.dart';
import 'package:customer_flutter_offline/core/widgets/custom_error_page.dart';
import 'package:customer_flutter_offline/core/widgets/custom_floating_action_button.dart';
import 'package:customer_flutter_offline/features/customer/customer_string.dart';
import 'package:customer_flutter_offline/features/customer/presentation/cubit/customer_cubit.dart';
import 'package:customer_flutter_offline/features/customer/presentation/cubit/customer_state.dart';
import 'package:customer_flutter_offline/core/widgets/custom_empty_page.dart';
import 'package:customer_flutter_offline/features/customer/presentation/widgets/customer_list.dart';
import 'package:customer_flutter_offline/features/customer/presentation/widgets/navigation/customer_form_arguments.dart';
import 'package:customer_flutter_offline/injection/config.dart';
import 'package:customer_flutter_offline/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPage();
}

class _CustomerPage extends State<CustomerPage> {
  late final CustomerCubit cubit;
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  void _showSnackBar({required String message, required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? ColorsApp.errorColor
            : ColorsApp.successColor,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  initState() {
    cubit = getIt.get<CustomerCubit>();
    cubit.fetchCustomer();
    super.initState();
  }

  @override
  dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, Space.xl),
          child: CustomAppBar(title: CustomerString.customer),
        ),
        body: BlocConsumer<CustomerCubit, CustomerState>(
          listener: (context, state) {
            if (state is CustomerSaveSuccessState) {
              _showSnackBar(message: state.message, isError: false);
            } else if (state is CustomerDeleteSuccessState) {
              _showSnackBar(message: state.message, isError: false);
            } else if (state is CustomerSaveErrorState) {
              _showSnackBar(message: state.message, isError: true);
            } else if (state is CustomerDeleteErrorState) {
              _showSnackBar(message: state.message, isError: true);
            }
          },
          builder: (BuildContext context, Object state) {
            switch (state) {
              case CustomerInitialState state:
                return CustomEmptyPage(message: state.message);
              case CustomerLoadingState _:
                return Center(child: CircularProgressIndicator());
              case CustomerSuccessState state:
                return SingleChildScrollView(
                  padding: EdgeInsets.all(Space.md),
                  child: Column(
                    children: [
                      TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: CustomerString.searchByName,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(Space.md - 2),
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          _debounce?.cancel();
                          _debounce = Timer(
                            const Duration(milliseconds: 500),
                            () {
                              cubit.searchCustomer(query: value);
                            },
                          );
                        },
                      ),
                      const SizedBox(height: Space.md),
                      CustomerList(customers: state.customers),
                    ],
                  ),
                );
              case CustomerErrorState state:
                return CustomErrorPage(message: state.message);
              default:
                return SizedBox.shrink();
            }
          },
        ),

        floatingActionButtonLocation: .endDocked,
        floatingActionButton: BlocBuilder<CustomerCubit, CustomerState>(
          builder: (BuildContext context, Object state) {
            switch (state) {
              case CustomerLoadingState _:
                return SizedBox.shrink();
              default:
                return CustomFloatingActionButton(
                  onPressed: () {
                    context.navigateTo(
                      context: context,
                      routeName: AppRoutes.customerForm,
                      arguments: CustomerFormArguments(cubit: cubit),
                    );
                  },
                );
            }
          },
        ),
        bottomNavigationBar: BlocBuilder<CustomerCubit, CustomerState>(
          builder: (BuildContext context, Object state) {
            switch (state) {
              case CustomerInitialState _:
                return CustomBottomBar(
                  title: CustomerString.customer,
                  totalItems: 0,
                );
              case CustomerSuccessState state:
                return CustomBottomBar(
                  title: CustomerString.customer,
                  totalItems: state.customers.length,
                );

              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
