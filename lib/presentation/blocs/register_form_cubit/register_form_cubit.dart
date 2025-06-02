import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_forms/infraestructure/infraestructure_exports.dart';
import 'package:formz/formz.dart';

part 'register_form_state.dart';

class RegisterFormCubit extends Cubit<RegisterFormState> {
  RegisterFormCubit() : super(const RegisterFormState());

  void onSubmit(){
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        username: Username.dirty(state.username.value),
        password: Password.dirty(state.password.value),
        email: Email.dirty(state.email.value),
        isValid: Formz.validate([
          state.username,
          state.email,
          state.password
        ])
      )
    );

    print('Submit: $state');
  }

  void usernameChanged(String value) {
    final username = Username.dirty(value);

    emit(state.copyWith(
      username: username,
      isValid: Formz.validate([username, state.email, state.password])
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);

    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([email, state.username, state.password])
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([password, state.username, state.email])
    ));
  }

}
