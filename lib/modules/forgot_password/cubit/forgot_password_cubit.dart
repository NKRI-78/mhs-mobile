import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/forgot_password/cubit/forgot_password_state.dart';
import 'package:mhs_mobile/repositories/auth_repository/auth_repository.dart';
import 'package:mhs_mobile/router/builder.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordState());

  AuthRepository repo = getIt<AuthRepository>();

  Future<void> submit(BuildContext context) async {
    try {
      emit(state.copyWith(loading: true));
      await repo.forgotPasswordSendOTP(state.email);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: successColor,
            content: Text(
              'Silahkan cek email',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
        ForgotPasswordOtpRoute(email: state.email).push(context);
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

  void copyState({required ForgotPasswordState newState}) {
    emit(newState);
  }
}