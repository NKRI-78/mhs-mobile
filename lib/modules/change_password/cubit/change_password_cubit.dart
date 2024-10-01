import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/repositories/home_repository/home_repository.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(const ChangePasswordState());

  HomeRepository repo = getIt<HomeRepository>();

  bool submissionValidation(
    BuildContext context, {
    required String password,
    required String passwordConfirm,
  }) {
    debugPrint("Password $password Confirm Password $passwordConfirm");
    if (passwordConfirm != password) {
      ShowSnackbar.snackbar(context, "Kata Sandi tidak cocok", '',
          errorColor);
      return false;
    }

    return true;
  }

  Future<void> submit(BuildContext context) async {
    try {
      final bool isClear = submissionValidation(
        context, 
        password: state.password, 
        passwordConfirm: state.confirmPassword
      );

      if(isClear){
        if (state.password.isEmpty) {
          throw 'Password cannot be null';
        }
        if (state.password == state.confirmPassword) {
          emit(state.copyWith(loading: true));

          await repo.changePassword(password: state.password);

          if (context.mounted) {
            HomeRoute().go(context);
          }
        } else {
          throw 'Confirm password wrong';
        }
      }
    } catch (e) {
      emit(state.copyWith(loading: false));
      throw "Ada masalah pada server";
    }
  }

  void passwordStateEmit(String value) {
    emit(state.copyWith(password: value));
  }

  void confirmPasswordStateEmit(String value) {
    emit(state.copyWith(confirmPassword: value));
  }
}
