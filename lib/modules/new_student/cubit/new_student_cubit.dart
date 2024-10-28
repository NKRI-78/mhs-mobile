import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/new_student/models/new_student_model.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';

part 'new_student_state.dart';

class NewStudentCubit extends Cubit<NewStudentState> {
  NewStudentCubit() : super(const NewStudentState());

  bool submissionValidation(
    BuildContext context, {
    required String phone,
    required String parentPhone,
    required String gender,
    required String outfitSize,
    required String birthDate,
  }) {
    if (phone.length < 10) {
      ShowSnackbar.snackbar(context, "No Hp Minimal 10 Angka", '',
          errorColor);
      return false;
    } else if (parentPhone.length < 10) {
      ShowSnackbar.snackbar(context, "No Hp Orang Tua Minimal 10 Angka", '',
          errorColor);
      return false;
    } else if (gender == "") {
      ShowSnackbar.snackbar(context, "Jenis Kelamin Anda Belum di pilih", '',
          errorColor);
      return false;
    } else if (outfitSize == "") {
      ShowSnackbar.snackbar(context, "Ukuran Baju Anda Belum di pilih", '',
          errorColor);
      return false;
    } else if (birthDate == "") {
      ShowSnackbar.snackbar(context, "Tanggal Lahir Anda Belum di pilih", '',
          errorColor);
      return false;
    }

    return true;
  }

  void copyToState({
    String? fullname,
    String? birthDate,
    String? originSchool,
    String? parentName,
    String? phone,
    String? parentPhone,
    String? outfitSize,
    String? height,
    String? gender,
  }) {
    emit(state.copyWith(
      fullname: fullname,
      birthDate: birthDate,
      originSchool: originSchool,
      parentName: parentName,
      phone: phone,
      parentPhone: parentPhone,
      outfitSize: outfitSize,
      height: height,
      gender: gender,
    ));
  }
}
