// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'partnership_cubit.dart';

@JsonSerializable()
final class PartnershipState extends Equatable {
  final List<PartnershipData> partnership;
  final int nextPagePartnership;
  final bool loadingModul;

  const PartnershipState({
    this.partnership = const [],
    this.nextPagePartnership = 1,
    this.loadingModul = false,
  });

  @override
  List<Object?> get props => [
        partnership,
        nextPagePartnership,
        loadingModul
      ];

  PartnershipState copyWith({
    List<PartnershipData>? partnership,
    int? nextPagePartnership,
    bool? loadingModul,
  }) {
    return PartnershipState(
      partnership: partnership ?? this.partnership,
      nextPagePartnership: nextPagePartnership ?? this.nextPagePartnership,
      loadingModul: loadingModul ?? this.loadingModul,
    );
  }
}
