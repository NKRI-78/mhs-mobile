import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.title, required this.isCircle, this.isPrimary = false, this.widgetRight});

  final String title;
  final bool isCircle;
  final bool? isPrimary;
  final List<Widget>? widgetRight;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: isPrimary == true || isCircle == true ? primaryColor : whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(isCircle ? 70 : 0)),
      ),
      title: Text(
        title, 
        style: TextStyle(
          color: isPrimary == true || isCircle == true ? whiteColor : blackColor,
        ),
      ),
      pinned: true,
      toolbarHeight: 30,
      expandedHeight: 40,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios_new,
          color: isPrimary == true || isCircle == true ? whiteColor : blackColor,
        ),
      ),
      actions: widgetRight,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Container(
          decoration: BoxDecoration(
            color: isPrimary == true || isCircle == true ? primaryColor : whiteColor,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(isCircle ? 70 : 0))
          ),
        ),
      ),
      bottom: PreferredSize(
        // Add this code
        preferredSize: const Size.fromHeight(-30), // Add this code
        child: Container(), // Add this code
      ),
    );
  }
}