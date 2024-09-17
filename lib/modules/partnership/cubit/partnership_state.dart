// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'partnership_cubit.dart';

@JsonSerializable()
final class PartnershipState extends Equatable {
  final List<PartnershipData> partnership;
  final int nextPagePartnership;
  final bool loadingPartnership;

  const PartnershipState({
    this.partnership = const [],
    this.nextPagePartnership = 1,
    this.loadingPartnership = true,
  });

  @override
  List<Object?> get props => [
        partnership,
        nextPagePartnership,
        loadingPartnership
      ];

  PartnershipState copyWith({
    List<PartnershipData>? partnership,
    int? nextPagePartnership,
    bool? loadingPartnership,
  }) {
    return PartnershipState(
      partnership: partnership ?? this.partnership,
      nextPagePartnership: nextPagePartnership ?? this.nextPagePartnership,
      loadingPartnership: loadingPartnership ?? this.loadingPartnership,
    );
  }
}
