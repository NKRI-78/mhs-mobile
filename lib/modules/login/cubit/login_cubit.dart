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

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  AuthRepository repo = getIt<AuthRepository>();

  void copyState(LoginState newState) {
    emit(newState);
  }

  Future<void> submit(BuildContext context) async {
    try {
      emit(state.copyWith(loading: true));
      final loggedIn =
          await repo.login(email: state.email, password: state.password);
      if (context.mounted) {
        getIt<AppBloc>()
            .add(SetAuthenticated(user: loggedIn.user, token: loggedIn.token));
        if (getIt.isRegistered<HomeBloc>()) {
          getIt<HomeBloc>().add(HomeInitialData());
        }
        HomeRoute().go(context);
      }
    } on EmailNotActivatedFailure {
      if (!context.mounted) {
        return;
      }
      RegisterOtpRoute(email: state.email).push(context);
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

  Future<void> submitGuest(
      BuildContext context, String email, String password) async {
    try {
      emit(state.copyWith(loading: true));
      final loggedIn = await repo.login(email: email, password: password);
      if (context.mounted) {
        getIt<AppBloc>()
            .add(SetAuthenticated(user: loggedIn.user, token: loggedIn.token));
        HomeRoute().go(context);
      }
    } on EmailNotActivatedFailure {
      if (!context.mounted) {
        return;
      }
      RegisterOtpRoute(email: email).push(context);
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
