// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_parent_cubit.dart';

final class LoginPaarentState extends Equatable {
  final String fullname;
  final String nis;
  final bool loading;

  const LoginPaarentState({
    this.fullname = '',
    this.nis = '',
    this.loading = false,
  });
  @override
  List<Object?> get props => [
    fullname, 
    nis, 
    loading
  ];

  LoginPaarentState copyWith({
    String? fullname,
    String? nis,
    bool? loading,
  }) {
    return LoginPaarentState(
      fullname: fullname ?? this.fullname,
      nis: nis ?? this.nis,
      loading: loading ?? this.loading,
    );
  }
}
