import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mhs_mobile/repositories/partnership_repository/models/partnership_model.dart';
import 'package:mhs_mobile/repositories/partnership_repository/partnership_repository.dart';

part 'partnership_state.dart';

class PartnershipCubit extends Cubit<PartnershipState> {
  PartnershipCubit() : super(const PartnershipState());

  final partnership = PartnershipRepository();

  void copyState({required PartnershipState newState}) {
    emit(newState);
  }

  Future<void> fetchPartnership() async {
    try {
      emit(state.copyWith(loadingPartnership: true));
      var value = await partnership.getPartnership();
      emit(state.copyWith(partnership: value));
    } catch (e) {
      rethrow;
    } finally {
      emit(state.copyWith(loadingPartnership: false));
    }
  }
}