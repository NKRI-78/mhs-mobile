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

part 'login_parent_state.dart';

class LoginParentCubit extends Cubit<LoginPaarentState> {
  LoginParentCubit() : super(const LoginPaarentState());

  AuthRepository repo = getIt<AuthRepository>();

  void copyState(LoginPaarentState newState) {
    emit(newState);
  }

  Future<void> submit(BuildContext context) async {
    try {
      emit(state.copyWith(loading: true));
      final loggedIn = await repo.loginParent(fullname: state.fullname, nisn: state.nis, student: state.student);
      if (context.mounted) {
        getIt<AppBloc>().add(SetAuthenticated(user: loggedIn.user, token: loggedIn.token));
        if (getIt.isRegistered<HomeBloc>()) {
          getIt<HomeBloc>().add(HomeInitialData());
        }
        HomeRoute().go(context);
      }
    } catch (e) {
      if (!context.mounted) {
        return;
      }
      ShowSnackbar.snackbar(context, e.toString(), '', errorColor);
      throw "Ada masalah pada server";
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}
