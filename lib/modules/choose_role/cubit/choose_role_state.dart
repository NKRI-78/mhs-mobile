part of 'choose_role_cubit.dart';

final class ChooseRoleState extends Equatable {
  final String roleSelect;
  final bool loading;
  final GenerationOpenModel? generation;

  const ChooseRoleState({
    this.roleSelect = '',
    this.loading = false,
    this.generation,
  });

  @override
  List<Object?> get props => [roleSelect, loading];

  ChooseRoleState copyWith({
    String? roleSelect,
    bool? loading,
    GenerationOpenModel? generation,
  }) {
    return ChooseRoleState(
      roleSelect: roleSelect ?? this.roleSelect,
      loading: loading ?? this.loading,
      generation: generation ?? this.generation,
    );
  }
}