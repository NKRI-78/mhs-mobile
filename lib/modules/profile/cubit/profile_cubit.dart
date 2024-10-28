import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/profile/cubit/profile_state.dart';
import 'package:mhs_mobile/repositories/app_repository/models/profile_model.dart';
import 'package:mhs_mobile/repositories/home_repository/home_repository.dart';
import 'package:mhs_mobile/repositories/profile_repository/profile_repository.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  ProfileRepository repo = getIt<ProfileRepository>();
  final homeRepo = HomeRepository();

  Future<void> fetchProfile() async {
    try {
      ProfileModel? data = await homeRepo.getProfile();
      emit(state.copyWith(profile: data, avatar: data.data.profile?.pictureUrl ?? ""));
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      emit(state.copyWith(loadingProfile: false));
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

  Future<void> uploadProfile(
      {required BuildContext context}) async {
    try {
      final linkImage = await repo.postMedia(folder: "images", media: state.fileImage!);
      final remaplink = linkImage.map((e) => {'url': e, 'type': "image"}).toList();

      await repo.updateProfile(linkAvatar: remaplink[0]['url']['url'],
      );
      emit(state.copyWith(fileImage: null, isSelected: false, avatar: remaplink[0]['url']['url']));
      
      if(context.mounted){
        ShowSnackbar.snackbar(context, "Profil berhasil diubah", '', successColor);
      }
    } catch (e) {
      if (!context.mounted) {
        return;
      }
      debugPrint("Error : $e");
      ShowSnackbar.snackbar(context, e.toString(), '', errorColor);
    }
  }

  Future<void> removeImage() async {
    debugPrint("Clicked");
    try { 
      emit(state.copyWith(fileImage: () => null, isSelected: false));
      debugPrint("Is Selected : ${state.isSelected}");
    } catch (e) {
      debugPrint("Error : $e");
    }
  }

  void copyState({required ProfileState newState}) {
    emit(newState);
  }

  @override
  Future<void> close() {
    emit(state.copyWith(isSelected: false));
    return super.close();
  }
}
