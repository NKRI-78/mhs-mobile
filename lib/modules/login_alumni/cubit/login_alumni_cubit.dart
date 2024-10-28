import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/app/bloc/app_bloc.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/repositories/auth_repository/auth_repository.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';

part 'login_alumni_state.dart';

class LoginAlumniCubit extends Cubit<LoginAlumniState> {
  LoginAlumniCubit() : super(const LoginAlumniState());

  AuthRepository repo = getIt<AuthRepository>();

  void copyState(LoginAlumniState newState) {
    emit(newState);
  }

  Future<void> submit(BuildContext context) async {
    try {
      emit(state.copyWith(loading: true));
      await repo.loginAlumni(nisn: state.nis, query: state.query);
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
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}
