part of 'register_form_cubit.dart';

enum FormStatus {invalid, valid, validating, posting}

class RegisterFormState extends Equatable {
  final bool isValid;
  final FormStatus formStatus;
  final Username username;
  final Email email;
  final Password password;

  const RegisterFormState({
    this.isValid = false,
    this.formStatus = FormStatus.invalid, 
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure()
  });

  RegisterFormState copyWith({
    bool? isValid,
    FormStatus? formStatus,
    Username? username,
    Email? email,
    Password? password
  }) => RegisterFormState(
    isValid: isValid ?? this.isValid,
    formStatus: formStatus ?? this.formStatus,
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password
  );

  @override
  List<Object> get props => [isValid, formStatus, username, email, password];
}
