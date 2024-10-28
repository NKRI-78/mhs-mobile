// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_alumni_cubit.dart';

final class LoginAlumniState extends Equatable {
  final String query;
  final String nis;
  final bool loading;

  const LoginAlumniState({
    this.query = '',
    this.nis = '',
    this.loading = false,
  });
  @override
  List<Object?> get props => [
    query,
    nis, 
    loading
  ];

  LoginAlumniState copyWith({
    String? query,
    String? nis,
    bool? loading,
  }) {
    return LoginAlumniState(
      query: query ?? this.query,
      nis: nis ?? this.nis,
      loading: loading ?? this.loading,
    );
  }
}
