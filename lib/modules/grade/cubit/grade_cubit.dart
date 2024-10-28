import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/repositories/grade_student_repository/grade_student_repository.dart';
import 'package:mhs_mobile/repositories/grade_student_repository/model/grade_student_model.dart';
import 'package:mhs_mobile/repositories/grade_student_repository/model/grade_student_report_model.dart';

part 'grade_state.dart';

class GradeCubit extends Cubit<GradeState> {
  GradeCubit() : super(const GradeState());

  GradeStudentRepository repo = getIt<GradeStudentRepository>();

  Future<void> fetchGrade() async {
    try {
      emit(state.copyWith(loading: true));
      GradeStudentModel? data = await repo.getMyGrade();
      emit(state.copyWith(grade: data));
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> fetchGradeStudentReport() async {
    try {
      emit(state.copyWith(loading: true));
      GradeStudentReportModel? data = await repo.getStudentReport();
      emit(state.copyWith(gradeReport: data));
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}