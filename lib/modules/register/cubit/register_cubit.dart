import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/repositories/auth_repository/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  
  bool submissionValidation({
    required String phone,
    required String email,
    required String password,
    required String passwordConfirm,
  }) {
    debugPrint("Password $password Confirm Password $passwordConfirm");
    if (!email.contains(RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$'))) {
      throw 'Harap masukkan email yang tepat';
    } else if (phone.length < 10) {
      throw 'No Hp Minimal 10 Angka';
    } else if (password.length < 8) {
      throw 'Kata Sandi minimal 8 character';
    } else if (passwordConfirm.length < 8) {
      throw 'Konfirmasi Kata Sandi minimal 8 character';
    } else if (passwordConfirm != password) {
      throw 'Kata Sandi tidak cocok';
    }

    return true;
  }
  AuthRepository authRepo = getIt<AuthRepository>();



  void setState({
    String? name,
    String? phone,
    String? email,
    String? password,
    String? rePassword,
  }) {
    emit(state.copyWith(
        name: name,
        email: email,
        password: password,
        phone: phone,
        rePassword: rePassword));
  }

  Future<String> submit() async {
    try {
      emit(state.copyWith(loading: true));
      final bool isClear = submissionValidation(
        phone: state.phone,
        email: state.email, 
        password: state.password,
        passwordConfirm: state.rePassword,
      );
      if(isClear){
        await authRepo.register(
          name: state.name,
          email: state.email.toLowerCase(),
          phone: state.phone,
          password: state.password
        );
      }
      emit(state.copyWith(loading: false));
      return state.email;
    } catch (e) {
      emit(state.copyWith(loading: false));
      rethrow;
    }
  }
}
