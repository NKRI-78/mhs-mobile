// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String rePassword;
  final bool loading;

  const RegisterState(
      {this.name = '',
      this.phone = '',
      this.email = '',
      this.password = '',
      this.rePassword = '',
      this.loading = false});

  @override
  List<Object?> get props =>
      [name, phone, email, password, rePassword, loading];

  RegisterState copyWith({
    String? name,
    String? phone,
    String? email,
    String? password,
    String? rePassword,
    bool? loading,
  }) {
    return RegisterState(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
      loading: loading ?? this.loading,
    );
  }
}
