class ForgotPasswordOtpState {
  final String email;
  final bool loading;
  final String otp;

  ForgotPasswordOtpState({
    this.email = "",
    this.loading = false,
    this.otp = "",
  });

  ForgotPasswordOtpState copyWith({
    String? email,
    bool? loading,
    String? otp,
  }) {
    return ForgotPasswordOtpState(
      email: email ?? this.email,
      loading: loading ?? this.loading,
      otp: otp ?? this.otp,
    );
  }
}