import 'package:flutter/material.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          HeaderSection(
            title: "Privacy Policy", 
            isCircle: true,
            isPrimary: true,
          ),
        ],
      ),
    );
  }
}