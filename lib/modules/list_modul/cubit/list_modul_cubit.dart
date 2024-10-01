import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mhs_mobile/misc/pagination.dart';
import 'package:mhs_mobile/repositories/document_repository/document_repository.dart';
import 'package:mhs_mobile/repositories/document_repository/models/document_model.dart';

part 'list_modul_state.dart';
part 'list_modul_cubit.g.dart';

class ListModulCubit extends Cubit<ListModulState> {
  ListModulCubit() : super(const ListModulState());

  final document = DocumentRepository();

  void copyState({required ListModulState newState}) {
    emit(newState);
  }

  Future<void> fetchModul() async {
    try {
      emit(state.copyWith(loadingModul: true));
      var value = await document.getDocument("Lesson");
      var list = value;

      emit(state.copyWith(document: list, loadingModul: false));
    } catch (e) {
      throw "Ada masalah pada server";
    }
  }
}