import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mhs_mobile/misc/pagination.dart';
import 'package:mhs_mobile/repositories/home_repository/home_repository.dart';
import 'package:mhs_mobile/repositories/home_repository/models/testimoni_alumni_model.dart';
import 'package:mhs_mobile/repositories/home_repository/models/testimoni_model.dart';

part 'show_more_testimoni_state.dart';
part 'show_more_testimoni_cubit.g.dart';

class ShowMoreTestimoniCubit extends Cubit<ShowMoreTestimoniState> {
  ShowMoreTestimoniCubit() : super(const ShowMoreTestimoniState());

  final homeRepo = HomeRepository();

  Future<void> fetchTestimoni() async {
    try {
      emit(state.copyWith(loadingTestimoni: true));
      var value = await homeRepo.getTestimoni();
      var list = value;

      emit(state.copyWith(testimoni: list, loadingTestimoni: false));
    } catch (e) {
      emit(state.copyWith(loadingTestimoni: false,));
      throw "Ada masalah pada server";
    } finally {
      emit(state.copyWith(loadingTestimoni: false,));
    }
  }
}