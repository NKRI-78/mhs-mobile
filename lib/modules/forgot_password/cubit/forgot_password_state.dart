class ForgotPasswordState {
  final String email;
  final bool loading;

  ForgotPasswordState({
    this.email = "",
    this.loading = false,
  });

  ForgotPasswordState copyWith({
    String? email,
    bool? loading,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      loading: loading ?? this.loading,
    );
  }
}