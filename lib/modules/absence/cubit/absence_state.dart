// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'absence_cubit.dart';

final class AbsenceState extends Equatable {
  final bool loading;

  const AbsenceState({
    this.loading = false,
  });
  @override
  List<Object?> get props => [loading];

  AbsenceState copyWith({
    String? fullname,
    String? nis,
    bool? loading,
  }) {
    return AbsenceState(
      loading: loading ?? this.loading,
    );
  }
}
