class GalleryItemModel {
  GalleryItemModel({
    required this.id,
    required this.imageUrl,
    required this.index,
    required this.title,
  });
  // index in list of image
  final int index;
  // id image (image url) to use in hero animation
  final String id;
  // image url
  final String imageUrl;
  final String title;
}
