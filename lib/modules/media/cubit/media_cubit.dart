import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mhs_mobile/repositories/media_repository/media_repository.dart';
import 'package:mhs_mobile/repositories/media_repository/model/media_model.dart';

part 'media_state.dart';
part 'media_cubit.g.dart';

class MediaCubit extends Cubit<MediaState> {
  MediaCubit() : super(const MediaState());

  final media = MediaRepository();

  void copyState({required MediaState newState}) {
    emit(newState);
  }

  Future<void> fetchMedia() async {
    try {
      emit(state.copyWith(loadingMedia: true));
      var value = await media.getMedia();
      var list = value;

      emit(state.copyWith(media: list, loadingMedia: false));
    } catch (e) {
      rethrow;
    } finally {
      emit(state.copyWith(loadingMedia: false));
    }
  }
}