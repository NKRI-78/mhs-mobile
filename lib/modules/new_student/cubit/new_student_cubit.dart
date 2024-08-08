import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/modules/new_student/models/new_student_model.dart';

part 'new_student_state.dart';

class NewStudentCubit extends Cubit<NewStudentState> {
  NewStudentCubit() : super(const NewStudentState());

  void copyToState({
    String? fullname,
    String? birthDate,
    String? originSchool,
    String? parentName,
    String? phone,
    String? parentPhone,
    String? outfitSize,
    String? height,
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
    ));
  }
}
