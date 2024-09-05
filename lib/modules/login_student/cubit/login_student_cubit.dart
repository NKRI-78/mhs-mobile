import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/repositories/auth_repository/auth_repository.dart';
import 'package:mhs_mobile/router/builder.dart';

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
      await repo.loginExistingStudent(fullname: state.fullname, nisn: state.nis);
      if (context.mounted) {
        if (getIt.isRegistered<HomeBloc>()) {
          getIt<HomeBloc>().add(HomeInitialData());
        }
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: redColor,
          content: Text(
            "Verifikasi berhasil",
            style: TextStyle(color: primaryColor),
          ),
        ),
      );
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
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}
