import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';

class ImageCard extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final double radius;
  final BoxFit? fit;
  const ImageCard({super.key, required this.image, this.height, required this.radius, this.width, this.fit = BoxFit.fill});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      imageUrl: image,
      height: height,
      fit: fit,
      placeholder: (BuildContext context, String val) {
        return const SizedBox.shrink();
      },
      errorWidget: (BuildContext context, String text, dynamic _) {
        return Container(
          decoration: BoxDecoration(
            color: redColor,
            borderRadius: BorderRadius.all(Radius.circular(radius))
          ),
          child: Image.asset(
            imageDefault,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}