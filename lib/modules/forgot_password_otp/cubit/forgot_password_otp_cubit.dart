import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/forgot_password_otp/cubit/forgot_password_otp_state.dart';
import 'package:mhs_mobile/repositories/auth_repository/auth_repository.dart';
import 'package:mhs_mobile/router/builder.dart';

class ForgotPasswordOtpCubit extends Cubit<ForgotPasswordOtpState> {
  ForgotPasswordOtpCubit() : super(ForgotPasswordOtpState());

  AuthRepository repo = getIt<AuthRepository>();

  void init(String email) {
    emit(state.copyWith(email: email));
  }

  Future<void> submit(BuildContext context, String verificationCode) async {
    try {
      emit(state.copyWith(loading: true));
      await repo.forgotPasswordVerifyOTP(state.email, verificationCode);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: successColor,
            content: Text(
              'Berhasil Verifikasi OTP',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
        ForgotPasswordChangeRoute(email: state.email, otp: verificationCode).push(context);
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

  Future<void> forgotPasswordSendOTP(BuildContext context) async {
    try {
      emit(state.copyWith(loading: true));
      await repo.forgotPasswordSendOTP(state.email);
      debugPrint("Berhasil");
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

  void copyState({required ForgotPasswordOtpState newState}) {
    emit(newState);
  }
}