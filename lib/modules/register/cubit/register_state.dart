// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String rePassword;
  final String referral;
  final bool loading;
  final List<Contact>? contact;


  const RegisterState(
    {this.name = '',
    this.phone = '',
    this.email = '',
    this.password = '',
    this.rePassword = '',
    this.referral = '',
    this.loading = false,
    this.contact = const [],
  });

  @override
  List<Object?> get props =>
      [name, phone, email, password, rePassword, referral, loading];

  RegisterState copyWith({
    String? name,
    String? phone,
    String? email,
    String? password,
    String? rePassword,
    String? referral,
    bool? loading,
    List<Contact>? contact,
  }) {
    return RegisterState(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
      referral: referral ?? this.referral,
      loading: loading ?? this.loading,
      contact: contact ?? this.contact,
    );
  }
}
