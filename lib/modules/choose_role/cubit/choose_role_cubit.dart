import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/repositories/auth_repository/auth_repository.dart';
import 'package:mhs_mobile/repositories/auth_repository/models/user/generation_open.dart';

part 'choose_role_state.dart';

class ChooseRoleCubit extends Cubit<ChooseRoleState> {
  ChooseRoleCubit() : super(const ChooseRoleState());

  void copyState(ChooseRoleState newState) {
    emit(newState);
  }

  final repo = AuthRepository();

  Future<void> fetchGeneration() async {
    try {
      GenerationOpenModel? data = await repo.getGenerationOpen();

      emit(state.copyWith(generation: data));
    } on SocketException {
      throw "Terjadi kesalahan jaringan";
    }
  }
}