// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

final class LoginState extends Equatable {
  final String email;
  final String password;
  final bool loading;

  const LoginState({
    this.email = '',
    this.password = '',
    this.loading = false,
  });
  @override
  List<Object?> get props => [email, password, loading];

  LoginState copyWith({
    String? email,
    String? password,
    bool? loading,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      loading: loading ?? this.loading,
    );
  }
}
