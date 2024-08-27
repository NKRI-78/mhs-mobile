import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.title, required this.isCircle, this.isPrimary = false});

  final String title;
  final bool isCircle;
  final bool? isPrimary;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: isPrimary == true || isCircle == true ? primaryColor : whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(isCircle ? 70 : 0)),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          title, 
          style: TextStyle(
            color: isPrimary == true || isCircle == true ? whiteColor : blackColor,
          ),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: isPrimary == true || isCircle == true ? whiteColor : blackColor,
          ),
        ),
      ),
      floating: true,
      primary: true,
      snap: true,
      centerTitle: true,
      pinned: true,
      forceMaterialTransparency: false,
      automaticallyImplyLeading: false,
      expandedHeight: 80,
      toolbarHeight: 75,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Container(
          decoration: BoxDecoration(
            color: isPrimary == true || isCircle == true ? primaryColor : whiteColor,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(isCircle ? 70 : 0))
          ),
        ),
      ),
    );
  }
}