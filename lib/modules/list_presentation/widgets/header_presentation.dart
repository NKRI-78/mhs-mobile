import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';

class HeaderPresentation extends StatelessWidget {
  const HeaderPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
            backgroundColor:primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(70)),
          ),
          title: const Text(
            "Presentasi", 
            style: TextStyle(
              color: whiteColor,
            ),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: whiteColor,
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: Container(
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(70))
              ),
            ),
          )
          );
  }
}