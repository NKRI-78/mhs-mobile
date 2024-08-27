import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/app/bloc/app_bloc.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/repositories/auth_repository/auth_repository.dart';
import 'package:mhs_mobile/router/builder.dart';

part 'register_otp_state.dart';

class RegisterOtpCubit extends Cubit<RegisterOtpState> {
  RegisterOtpCubit() : super(RegisterOtpState());

  AuthRepository repo = getIt<AuthRepository>();
  AppBloc app = getIt<AppBloc>();

  void init(String email) {
    emit(state.copyWith(email: email));
    repo.verifyOtp(state.email, '', VerifyEmailType.sendingOtp);
  }

  Future<void> submit(String verificationCode, BuildContext context) async {
    try {
      emit(state.copyWith(loading: true));
      final user = await repo.verifyOtp(
          state.email, verificationCode, VerifyEmailType.verified);
      if (context.mounted && user != null) {
        if (getIt.isRegistered<HomeBloc>()) {
          getIt<HomeBloc>().add(HomeInitialData());
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: successColor,
            content: Text(
              'Verify berhasil, selamat datang di MHS-Mobile.',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );

        // getIt<AppBloc>().add(SetUserData(user: loggedIn.user, token: loggedIn.token));
        app.add(SetAuthenticated(user: user, token: user.token ?? ''));
        HomeRoute().go(context);
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

  Future<void> resendOtp(BuildContext context) async {
    try {
      emit(state.copyWith(loading: true));
      repo.verifyOtp(state.email, '', VerifyEmailType.sendingOtp);
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

  Future<void> chageEmailOtp(BuildContext context) async {
    try {
      emit(state.copyWith(loading: true));
      // await repo.chageEmailOtp(state.email, state.newEmail);
      debugPrint("Berhasil");
      emit(state.copyWith(email: state.newEmail));
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

  void copyState({required RegisterOtpState newState}) {
    emit(newState);
  }
}
