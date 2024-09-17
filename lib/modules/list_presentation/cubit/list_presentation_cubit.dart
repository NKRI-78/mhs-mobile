import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mhs_mobile/misc/pagination.dart';
import 'package:mhs_mobile/modules/list_presentation/model/gallery_item_model.dart';
import 'package:mhs_mobile/repositories/document_repository/document_repository.dart';
import 'package:mhs_mobile/repositories/document_repository/models/document_model.dart';

part 'list_presentation_state.dart';
part 'list_presentation_cubit.g.dart';

class ListPresentationCubit extends Cubit<ListPresentationState> {
  ListPresentationCubit() : super(const ListPresentationState());

  final document = DocumentRepository();

  void copyState({required ListPresentationState newState}) {
    emit(newState);
  }

  Future<void> fetchPresentation() async {
    try {
      emit(state.copyWith(loadingPresentation: true));
      var value = await document.getDocument("Presentation");
      var list = value;

      emit(state.copyWith(document: list, loadingPresentation: false));
    } catch (e) {
      rethrow;
    }
  }
}