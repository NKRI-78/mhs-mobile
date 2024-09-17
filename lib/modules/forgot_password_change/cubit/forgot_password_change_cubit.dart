import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/forgot_password_change/cubit/forgot_password_change_state.dart';
import 'package:mhs_mobile/repositories/auth_repository/auth_repository.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';

class ForgotPasswordChangeCubit extends Cubit<ForgotPasswordChangeState> {
  ForgotPasswordChangeCubit({required this.email, required this.otp}) : super(ForgotPasswordChangeState());

  final String email;
  final String otp;

  AuthRepository repo = getIt<AuthRepository>();

  bool submissionValidation(
    BuildContext context, {
    required String password,
    required String passwordConfirm,
  }) {
    debugPrint("Password $password Confirm Password $passwordConfirm");
    if (password.length < 8) {
      ShowSnackbar.snackbar(context, "Kata Sandi minimal 8 character", '',
          redColor);
      return false;
    } else if (passwordConfirm.length < 8) {
      ShowSnackbar.snackbar(context, "Konfirmasi Kata Sandi minimal 8 character", '',
          redColor);
      return false;
    } else if (passwordConfirm != password) {
      ShowSnackbar.snackbar(context, "Kata Sandi tidak cocok", '',
          redColor);
      return false;
    }

    return true;
  }

  Future<void> submit(BuildContext context) async {
    try {
      emit(state.copyWith(loading: true));

      final bool isClear = submissionValidation(
      context,
        password: state.password,
        passwordConfirm: state.passwordConfirm
      );

      if(isClear){
        await repo.forgotPasswordChangePass(email, otp, state.password);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: successColor,
              content: Text(
                'Password berhasil diubah',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
          LoginRoute().go(context);
        }
      }
    } catch (e) {
      if (!context.mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: redColor,
          content: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void copyState({required ForgotPasswordChangeState newState}) {
    emit(newState);
  }
}