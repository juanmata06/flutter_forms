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

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final formCubit = context.watch<RegisterFormCubit>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 20),
          CustomTextFormField(
            label: 'Username',
            onChanged: (value) {
              formCubit.usernameChanged(value!);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if(value == null || value.isEmpty) return 'Required field';
              if(value.trim().isEmpty) return 'Required field';
              if(value.length < 4) return 'Min 4 characters';
              return null;
            },
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            label: 'Email',
            onChanged: (value) {
              formCubit.emailChanged(value!);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if(value == null || value.isEmpty) return 'Required field';
              if(value.trim().isEmpty) return 'Required field';
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              if(!emailRegExp.hasMatch(value)) return 'Email format invalid';
              return null;
            },
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            label: 'Password',
            onChanged: (value) {
              formCubit.passwordChanged(value!);
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if(value == null || value.isEmpty) return 'Required field';
              if(value.trim().isEmpty) return 'Required field';
              if(value.length < 4) return 'Min 4 characters';
              return null;
            },
            obscureText: true,
          ),
          SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              final isFormValid = _formKey.currentState!.validate();
              if(!isFormValid) return;
              formCubit.onSubmit();
            }, 
            icon: Icon(Icons.save),
            label: Text('Submit')
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}