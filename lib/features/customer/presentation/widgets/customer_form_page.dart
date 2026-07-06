import 'package:customer_flutter_offline/core/styles/space.dart';
import 'package:customer_flutter_offline/core/widgets/custom_app_bar.dart';
import 'package:customer_flutter_offline/core/widgets/custom_button.dart';
import 'package:customer_flutter_offline/core/widgets/custom_form_field.dart';
import 'package:customer_flutter_offline/core/widgets/custom_label_text_form.dart';
import 'package:customer_flutter_offline/features/customer/customer_string.dart';
import 'package:customer_flutter_offline/features/customer/presentation/cubit/customer_cubit.dart';
import 'package:customer_flutter_offline/features/customer/presentation/cubit/customer_state.dart';
import 'package:customer_flutter_offline/features/customer/presentation/widgets/navigation/customer_form_arguments.dart';
import 'package:customer_flutter_offline/injection/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerFormPage extends StatefulWidget {
  const CustomerFormPage({required this.arguments, super.key});

  final CustomerFormArguments arguments;

  @override
  State<CustomerFormPage> createState() => _CustomerFormPage();
}

class _CustomerFormPage extends State<CustomerFormPage> {
  late final CustomerCubit cubit;
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    cubit = getIt.get<CustomerCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, Space.xl),
          child: CustomAppBar(title: CustomerString.createCustomer),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(Space.md),
          child: Form(
            key: _formState,
            child: BlocListener<CustomerCubit, CustomerState>(
              listener: (context, state) {
                if (state is CustomerFortState) {
                  if (state.customer != null) {
                    _nameController.text = state.customer!.name;
                    _phoneController.text = state.customer!.cellphone;
                    _emailController.text = state.customer!.email ?? '';
                  }
                }
              },
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  CustomLabelTextForm(label: CustomerString.name),
                  const SizedBox(height: Space.xs),
                  CustomFormField(
                    hintText: CustomerString.typeCustomerName,
                    onChanged: (value) {},
                    validator: (value) => null,
                    controller: _nameController,
                  ),
                  const SizedBox(height: Space.md),
                  CustomLabelTextForm(label: CustomerString.cellphone),
                  const SizedBox(height: Space.xs),
                  CustomFormField(
                    hintText: CustomerString.typeCustomerPhone,
                    onChanged: (value) {},
                    validator: (value) => null,
                    controller: _phoneController,
                  ),
                  const SizedBox(height: Space.md),
                  CustomLabelTextForm(label: CustomerString.email),
                  const SizedBox(height: Space.xs),
                  CustomFormField(
                    hintText: CustomerString.typeCustomerEmail,
                    onChanged: (value) {},
                    validator: (value) => null,
                    controller: _emailController,
                  ),
                  const SizedBox(height: Space.md),
                  Center(
                    child: CustomButton(
                      onPressed: () {},
                      textButton: CustomerString.save,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
