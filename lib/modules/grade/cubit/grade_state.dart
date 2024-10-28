part of 'grade_cubit.dart';

class GradeState extends Equatable {
  final GradeStudentModel? grade;
  final GradeStudentReportModel? gradeReport;
  final bool loading;

  const GradeState({
    this.grade,
    this.gradeReport,
    this.loading = false,
  });


  @override
  List<Object?> get props => [
    grade,
    loading,
    gradeReport,
  ];

  GradeState copyWith({
    GradeStudentModel? grade,
    GradeStudentReportModel? gradeReport,
    bool? loading,
  }) {
    return GradeState(
      grade: grade ?? this.grade,
      gradeReport: gradeReport ?? this.gradeReport,
      loading: loading ?? this.loading,
    );
  }
}