import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/repositories/event_repository/event_repository.dart';
import 'package:mhs_mobile/repositories/event_repository/models/event_detail_model.dart';

part 'event_detail_state.dart';

class EventDetailCubit extends Cubit<EventDetailState> {
  EventDetailCubit() : super(const EventDetailState());
  
  EventRepository repo = getIt<EventRepository>();

  void copyState({required EventDetailState newState}) {
    emit(newState);
  }

  Future<void> fetchDetailEvent(int idEvent) async {
    try {
      emit(state.copyWith(loading: true));
      final event = await repo.getEventDetail(idEvent.toString());
      debugPrint("id event fetch $idEvent");
      emit(state.copyWith(event: event, idEvent: idEvent.toString()));
    } catch (e) {
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> jointEvent(BuildContext context, String idEvent) async {
    await repo.jointEvent(
      idEvent: idEvent
    );
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: primaryColor,
        content: Text(
          "Anda Berhasil Join",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}