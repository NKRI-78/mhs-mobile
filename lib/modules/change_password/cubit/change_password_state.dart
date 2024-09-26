// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'change_password_cubit.dart';

final class ChangePasswordState extends Equatable {
  final String password;
  final String confirmPassword;
  final bool loading;

  const ChangePasswordState(
      {this.password = '', this.confirmPassword = '', this.loading = false});
  @override
  List<Object?> get props => [password, confirmPassword, loading];

  ChangePasswordState copyWith({
    String? password,
    String? confirmPassword,
    bool? loading,
  }) {
    return ChangePasswordState(
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      loading: loading ?? this.loading,
    );
  }
}
