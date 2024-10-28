part of "add_testimoni_cubit.dart";

class AddTestimoniState extends Equatable {
  final String caption;
  final String msg;
  final double rating;
  final String? avatar;
  final File? fileImage;
  final bool isSelected;
  final bool loading;

  const AddTestimoniState({
    this.caption = "",
    this.msg = "",
    this.rating = 0,
    this.fileImage,
    this.avatar,
    this.isSelected = false,
    this.loading = false,
  });

  @override
  List<Object?> get props => [
    caption,
    msg,
    rating,
    fileImage,
    avatar,
    isSelected,
    loading,
  ];

  AddTestimoniState copyWith({
    String? caption,
    String? msg,
    double? rating,
    String? avatar,
    ValueGetter<File?>? fileImage,
    bool? loading,
    bool? isSelected,
  }) {
    return AddTestimoniState(
      caption: caption ?? this.caption,
      msg: msg ?? this.msg,
      rating: rating ?? this.rating,
      avatar: avatar ?? this.avatar,
      fileImage: fileImage != null ? fileImage() : this.fileImage,
      loading: loading ?? this.loading,
      isSelected: isSelected ?? this.isSelected
    );
  }
}