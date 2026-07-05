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
import 'package:customer_flutter_offline/injection/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPage();
}

class _CustomerPage extends State<CustomerPage> {
  late final CustomerCubit cubit;

  @override
  initState() {
    cubit = getIt.get<CustomerCubit>();
    cubit.fetchCustomer();
    super.initState();
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
        body: BlocBuilder<CustomerCubit, CustomerState>(
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
                        decoration: InputDecoration(
                          hintText: CustomerString.searchByNameCpf,

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(Space.md - 2),
                            ),
                          ),
                        ),
                        onChanged: (value) {},
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
                return CustomFloatingActionButton(onPressed: () {});
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
