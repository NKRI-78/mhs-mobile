import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mhs_mobile/repositories/partnership_repository/models/partnership_model.dart';
import 'package:mhs_mobile/repositories/partnership_repository/partnership_repository.dart';

part 'partnership_state.dart';
part 'partnership_cubit.g.dart';

class PartnershipCubit extends Cubit<PartnershipState> {
  PartnershipCubit() : super(const PartnershipState());

  final partnership = PartnershipRepository();

  void copyState({required PartnershipState newState}) {
    emit(newState);
  }

  Future<void> fetchPartnership() async {
    try {
      var value = await partnership.getPartnership();
      var list = value;

      emit(state.copyWith(partnership: list, loadingModul: false));
    } catch (e) {
      rethrow;
    } finally {
      emit(state.copyWith(loadingModul: false));
    }
  }
}