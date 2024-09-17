class ForgotPasswordChangeState {
  final bool loading;
  final String password;
  final String passwordConfirm;

  ForgotPasswordChangeState({
    this.loading = false,
    this.password = '',
    this.passwordConfirm = '',
  });

  ForgotPasswordChangeState copyWith({
    bool? loading,
    String? password,
    String? passwordConfirm,
  }) {
    return ForgotPasswordChangeState(
      loading: loading ?? this.loading,
      password: password ?? this.password,
      passwordConfirm: passwordConfirm ?? this.passwordConfirm,
    );
  }
}