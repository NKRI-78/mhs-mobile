import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/repositories/auth_repository/auth_repository.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';

part 'login_student_state.dart';

class LoginStudentCubit extends Cubit<LoginStudentState> {
  LoginStudentCubit() : super(const LoginStudentState());

  AuthRepository repo = getIt<AuthRepository>();

  void copyState(LoginStudentState newState) {
    emit(newState);
  }

  Future<void> submit(BuildContext context) async {
    try {
      emit(state.copyWith(loading: true));
      await repo.loginExistingStudent(nisn: state.nis);
      if (context.mounted) {
        if (getIt.isRegistered<HomeBloc>()) {
          getIt<HomeBloc>().add(HomeInitialData());
        }
        ShowSnackbar.snackbar(context, "Verifikasi Berhasil", '', successColor);
        HomeRoute().go(context);
      }
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
    } catch (e) {
      if (!context.mounted) {
        return;
      }
      ShowSnackbar.snackbar(context, e.toString(), '', errorColor);
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}
