import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/partnership/models/partnership_model.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';
  
List<PartnershipModel> listPartnership =[
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
  PartnershipModel(
    image: "https://via.placeholder.com/93x66"
  ),
];

class PartnershipPage extends StatelessWidget {
  const PartnershipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PartnershipView();
  }
}

class PartnershipView extends StatelessWidget {
  const PartnershipView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        slivers: [
          const HeaderSection(
            title: "Partnership", 
            isCircle: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            sliver : SliverGrid.builder(
              itemCount: listPartnership.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
              ),  
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ImageCard(image: 
                  listPartnership[index].image, 
                  radius: 0, 
                  width: double.infinity
                  ),
                );
              },
            ),
          )
        ]
      ),
    );
  }
}