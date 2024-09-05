import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mhs_mobile/misc/pagination.dart';
import 'package:mhs_mobile/modules/list_presentation/model/gallery_item_model.dart';
import 'package:mhs_mobile/repositories/document_repository/document_repository.dart';
import 'package:mhs_mobile/repositories/document_repository/models/document_model.dart';

part 'list_brocure_state.dart';
part 'list_brocure_cubit.g.dart';

class ListBrocureCubit extends Cubit<ListBrocureState> {
  ListBrocureCubit() : super(const ListBrocureState());

  final document = DocumentRepository();

  void copyState({required ListBrocureState newState}) {
    emit(newState);
  }

  Future<void> fetchBrochure() async {
    try {
      var value = await document.getDocument("Brochure");
      var list = value;

      emit(state.copyWith(document: list, loadingBrocuhure: false));
    } catch (e) {
      rethrow;
    } finally {
      emit(state.copyWith(loadingBrocuhure: false));
    }
  }
}