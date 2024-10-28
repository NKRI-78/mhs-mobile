import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:mhs_mobile/repositories/app_repository/models/profile_model.dart';

class ProfileState extends Equatable {
  final String fullname;
  final String address;
  final String? avatar;
  final bool isSelected;
  final File? fileImage;
  final ProfileModel? profile;
  final bool loadingProfile;

  const ProfileState({
    this.fullname = "",
    this.address = "",
    this.isSelected = false,
    this.avatar = "",
    this.fileImage,
    this.profile,
    this.loadingProfile = true,
  });

  @override
  List<Object?> get props => [
    fullname,
    address,
    isSelected,
    avatar,
    fileImage,
    profile,
    loadingProfile,
  ];

  ProfileState copyWith({
    String? fullname,
    String? address,
    bool? isSelected,
    String? avatar,
    ValueGetter<File?>? fileImage,
    ProfileModel? profile,
    bool? loadingProfile,
  }) {
    return ProfileState(
      address: address ?? this.address,
      isSelected: isSelected ?? this.isSelected,
      fullname: fullname ?? this.fullname,
      avatar: avatar ?? this.avatar,
      fileImage: fileImage != null ? fileImage() : this.fileImage,
      profile: profile ?? this.profile,
      loadingProfile: loadingProfile ?? this.loadingProfile,
    );
  }
  
}