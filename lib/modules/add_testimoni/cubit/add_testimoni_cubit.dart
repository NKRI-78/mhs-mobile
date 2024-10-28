import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/repositories/add_testimoni_repository/add_testimoni_repository.dart';
import 'package:mhs_mobile/repositories/profile_repository/profile_repository.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';

part 'add_testimoni_state.dart';

class AddTestimoniCubit extends Cubit<AddTestimoniState> {
  AddTestimoniCubit() : super (const AddTestimoniState());

  void copyState(AddTestimoniState newState) {
    emit(newState);
  }

  AddTestimoniRepository repo = getIt<AddTestimoniRepository>();
  ProfileRepository repoProfile = getIt<ProfileRepository>();

  bool submissionValidation (
    BuildContext context,{
      required String caption,
      required String msg,
      required double rating,
  }) {
    return true;
  }

  Future<void> sumbitTestimoni(BuildContext context) async {
    try {
      emit(state.copyWith(loading: true));
      final bool isClear = submissionValidation(
        context, 
        caption: state.caption, 
        msg: state.msg,
        rating: state.rating,
      );
      if(state.fileImage == null){
        if (context.mounted) {
          ShowSnackbar.snackbar(context, "Foto Belum dipilih", '', errorColor);
        }
      } else {
        final linkImage = await repoProfile.postMedia(folder: "images", media: state.fileImage!);
        final remaplink = linkImage.map((e) => {'url': e, 'type': "image"}).toList();
        
        if(isClear){
          await repo.addTestimoni(caption: state.caption, msg: state.msg, imageUrl: remaplink[0]['url']['url']);
          emit(state.copyWith(fileImage: null, isSelected: false));
          if (context.mounted) {
            ShowSnackbar.snackbar(context, "Testimoni anda sudah terkirim", '', successColor);
            Navigator.of(context).pop();
          }
        }
      }
    } catch (e) {
      if (!context.mounted) {
        return;
      }
      ShowSnackbar.snackbar(context, e.toString(), '', errorColor);
      rethrow;
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> chooseFile(BuildContext context) async {
    ImageSource? imageSource = await showDialog<ImageSource>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text("Source Image"),
              actions: [
                MaterialButton(
                  child: const Text("Camera"),
                  onPressed: () async {
                    Navigator.pop(context, ImageSource.camera);
                  },
                ),
                MaterialButton(
                  child: const Text("Gallery"),
                  onPressed: () async {
                    Navigator.pop(context, ImageSource.gallery);
                  },
                )
              ],
            ));

    if (imageSource != null) {
      File? imageResult;
      if (imageSource == ImageSource.gallery) {
        FilePickerResult? result =
            await FilePicker.platform.pickFiles(type: FileType.image);
        File? cropped = await ImageCropper().cropImage(
            sourcePath: result!.files.single.path!,
            androidUiSettings: AndroidUiSettings(
                toolbarTitle: "Crop It",
                toolbarColor: Colors.blueGrey[900],
                toolbarWidgetColor: whiteColor,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
            iosUiSettings: const IOSUiSettings(
              minimumAspectRatio: 1.0,
            ));
        if (cropped != null) {
          imageResult = cropped;
          emit(state.copyWith(fileImage: () => imageResult, isSelected: true));
        } else {
          imageResult = null;
          emit(state.copyWith(fileImage: () => imageResult));
        }
      } else {
        File? fileImage;
        XFile? pickedFile = await ImagePicker().pickImage(
          source: ImageSource.camera,
        );
        fileImage = File(pickedFile!.path);
        File? cropped = await ImageCropper().cropImage(
            sourcePath: pickedFile.path,
            androidUiSettings: AndroidUiSettings(
                toolbarTitle: "Potong Gambar",
                toolbarColor: Colors.blueGrey[900],
                toolbarWidgetColor: whiteColor,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
            iosUiSettings: const IOSUiSettings(
              minimumAspectRatio: 1.0,
              title: "Potong Gambar",
            ));
        if (cropped != null) {
          fileImage = cropped;
          emit(state.copyWith(fileImage: () => fileImage, isSelected: true));
        } else {
          fileImage = null;
          emit(state.copyWith(fileImage: () => fileImage));
        }
      }
    }
  }

  Future<void> removeImage() async {
    debugPrint("Clicked");
    try { 
      emit(state.copyWith(fileImage: () => null));
      debugPrint("FileImage : ${state.fileImage}");
    } catch (e) {
      debugPrint("Error : $e");
    }
  }

  @override
  Future<void> close() {
    if (getIt.isRegistered<HomeBloc>()) {
      getIt<HomeBloc>().add(GetProfile());
    }
    return super.close();
  }
}