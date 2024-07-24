import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/repositories/auth_repository/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  AuthRepository authRepo = getIt<AuthRepository>();

  void setState({
    String? name,
    String? phone,
    String? email,
    String? password,
    String? rePassword,
  }) {
    emit(state.copyWith(
        name: name,
        email: email,
        password: password,
        phone: phone,
        rePassword: rePassword));
  }

  Future<String> submit() async {
    try {
      if (state.password != state.rePassword) {
        throw 'Konfirmasi kata sandi tidak sesuai';
      }
      emit(state.copyWith(loading: true));
      await authRepo.register(
          name: state.name,
          email: state.email.toLowerCase(),
          phone: state.phone,
          password: state.password);
      emit(state.copyWith(loading: false));
      return state.email;
    } catch (e) {
      emit(state.copyWith(loading: false));
      rethrow;
    }
  }
}
