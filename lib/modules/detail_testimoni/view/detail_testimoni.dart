import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/repositories/home_repository/models/testimoni_model.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';

class DetailTestimoni extends StatelessWidget {
  const DetailTestimoni({super.key, required this.testimoni});

  final TestimoniData testimoni;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          const HeaderSection(
            title: "Testimoni", 
            isCircle: false,
            isPrimary: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ImageCard(
                image: testimoni.imageUrl ?? "", 
                radius: 50,
                height: 400,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 15, right: 15, left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      testimoni.name ?? "",
                      style: const TextStyle(
                        color: blackColor,
                        fontSize: fontSizeLarge,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      testimoni.message ?? "",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: blackColor,
                        fontSize: fontSizeDefault,
                      ),
                    )
                  ],
                ),
              )
          ])),
        ],
      ),
    );
  }
}