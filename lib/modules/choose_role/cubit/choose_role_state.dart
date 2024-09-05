part of 'choose_role_cubit.dart';

final class ChooseRoleState extends Equatable {
  final String roleSelect;
  final bool loading;

  const ChooseRoleState({
    this.roleSelect = 'Siswa',
    this.loading = false,
  });

  @override
  List<Object?> get props => [roleSelect, loading];

  ChooseRoleState copyWith({
    String? roleSelect,
    bool? loading,
  }) {
    return ChooseRoleState(
      roleSelect: roleSelect ?? this.roleSelect,
      loading: loading ?? this.loading,
    );
  }
}