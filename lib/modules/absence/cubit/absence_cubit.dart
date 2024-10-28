import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/modal.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/repositories/absence_repository/absence_repository.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';

part 'absence_state.dart';

class AbsenceCubit extends Cubit<AbsenceState> {
  AbsenceCubit() : super(const AbsenceState());

  AbsenceRepository repo = getIt<AbsenceRepository>();

  void copyState(AbsenceState newState) {
    emit(newState);
  }

  Future<void> getCheckIn(BuildContext context, String token) async {
    try {  
      final checkInData = await repo.getAbseceChekin(token: token);
      debugPrint("Data checkin : ${checkInData.attendance.subject}");
      if (context.mounted) {
        GeneralModal.showResult(
          msg: "Berhasil Absen", 
          context: context,
          locationImage: successAbsence,
        );
      }
    } catch (e) {
      if (!context.mounted) {
        return;
      }
      ShowSnackbar.snackbar(context, e.toString(), '', errorColor);
    }
  }
}