import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_forms/presentation/blocs/register_form_cubit/register_form_cubit.dart';
import '../widgets/widgets_export.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterFormCubit(),
        child: const _FormView()
      ),
    );
  }
}

class _FormView extends StatelessWidget {
  const _FormView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              FlutterLogo(size: 100),
              _Form()
            ],
          ),
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    final formCubit = context.watch<RegisterFormCubit>();
    final usernameState = formCubit.state.username;
    final emailState = formCubit.state.email;
    final passwordState = formCubit.state.password;

    return Form(
      child: Column(
        children: [
          SizedBox(height: 20),
          CustomTextFormField(
            label: 'Username',
            onChanged: (value) => formCubit.usernameChanged(value!),
            errorText: usernameState.errorText
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            label: 'Email',
            onChanged: (value) => formCubit.emailChanged(value!),
            errorText: emailState.errorText
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            onChanged: (value) => formCubit.passwordChanged(value!),
            errorText: passwordState.errorText
          ),
          SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () => formCubit.onSubmit(),
            icon: Icon(Icons.save),
            label: Text('Submit')
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}