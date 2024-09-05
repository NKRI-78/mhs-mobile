// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_student_cubit.dart';

final class LoginStudentState extends Equatable {
  final String fullname;
  final String nis;
  final bool loading;

  const LoginStudentState({
    this.fullname = '',
    this.nis = '',
    this.loading = false,
  });
  @override
  List<Object?> get props => [fullname, nis, loading];

  LoginStudentState copyWith({
    String? fullname,
    String? nis,
    bool? loading,
  }) {
    return LoginStudentState(
      fullname: fullname ?? this.fullname,
      nis: nis ?? this.nis,
      loading: loading ?? this.loading,
    );
  }
}
