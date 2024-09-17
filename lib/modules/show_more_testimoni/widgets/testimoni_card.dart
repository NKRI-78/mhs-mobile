import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/modal.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/repositories/home_repository/models/testimoni_model.dart';
import 'package:mhs_mobile/widgets/images/image_circle.dart';

class TestimoniCard extends StatelessWidget {
  const TestimoniCard({super.key, required this.testimoni});

  final TestimoniData testimoni;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GeneralModal.showTestimoni(context: context, testimoni: testimoni);
      },
      child: Container(
        decoration: BoxDecoration(
          color: testimoniColor,
          borderRadius: BorderRadius.circular(16)
        ),
        width: 200,
        height: 170,
        child: Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(testimoni.name ?? "",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(testimoni.message ?? "",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: blackColor.withOpacity(0.80),
                          fontSize: fontSizeExtraSmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              top: -50,
              child: ImageCircle(
                image: testimoni.imageUrl ?? "", 
                radius: 45,
              ),
            )
          ],
        ),
      ),
    );
  }
}