import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';

class DetailEventList extends StatelessWidget {
  const DetailEventList({super.key, required this.imageUrl, required this.title, required this.address, required this.description, required this.date});

  final String imageUrl;
  final String title;
  final String address;
  final String description;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(builder: (context, costraints) {
          return SizedBox(
            width: costraints.maxWidth,
            height: costraints.maxWidth,
            child: ImageCard(
              image: imageUrl, 
              radius: 0, 
              width: double.infinity
            ),
          );
        }),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: blackColor,
                  fontSize: fontSizeExtraLarge,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.location_on,
                      size: 15,
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: Text(
                      address,
                      style: const TextStyle(
                        fontSize: fontSizeExtraSmall
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                description,
                style: TextStyle(
                  color: blackColor.withOpacity(0.6),
                  fontSize: fontSizeDefault,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        )
      ],
    );
  }
}