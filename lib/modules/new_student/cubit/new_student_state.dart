// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'new_student_cubit.dart';

class NewStudentState extends Equatable {
  final String fullname;
  final String birthDate;
  final String originSchool;
  final String parentName;
  final String phone;
  final String parentPhone;
  final String outfitSize;
  final String height;
  final String gender;

  const NewStudentState(
      {this.fullname = '',
      this.birthDate = '',
      this.originSchool = '',
      this.parentName = '',
      this.phone = '',
      this.parentPhone = '',
      this.outfitSize = '',
      this.height = '',
      this.gender = '',
    });

  NewStudentModel get toModel => NewStudentModel(
      fullname: fullname,
      birthDate: birthDate,
      originSchool: originSchool,
      parentName: parentName,
      phone: phone,
      parentPhone: parentPhone,
      outfitSize: outfitSize,
      height: height, gender: gender);

  @override
  List<Object?> get props => [
        fullname,
        birthDate,
        originSchool,
        parentName,
        phone,
        parentPhone,
        outfitSize,
        height,
        gender,
      ];

  NewStudentState copyWith({
    String? fullname,
    String? birthDate,
    String? originSchool,
    String? parentName,
    String? phone,
    String? parentPhone,
    String? outfitSize,
    String? height,
    String? gender
  }) {
    return NewStudentState(
      fullname: fullname ?? this.fullname,
      birthDate: birthDate ?? this.birthDate,
      originSchool: originSchool ?? this.originSchool,
      parentName: parentName ?? this.parentName,
      phone: phone ?? this.phone,
      parentPhone: parentPhone ?? this.parentPhone,
      outfitSize: outfitSize ?? this.outfitSize,
      height: height ?? this.height,
      gender: gender ?? this.gender,
    );
  }
}
