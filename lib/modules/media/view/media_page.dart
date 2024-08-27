  import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/images/image_circle.dart';

class MediaPage extends StatelessWidget {
  const MediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MediaView();
  }
}

class MediaView extends StatelessWidget {
  const MediaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        slivers: [
          const HeaderSection(
            title: "Media", 
            isCircle: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            sliver: SliverGrid.builder(
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 40,
                crossAxisSpacing: 20.0,
                childAspectRatio: 2.0
              ), 
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(17)
                  ),
                  width: 100,
                  height: 30,
                  child: const Stack(
                    fit: StackFit.loose,
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 35),
                              child: Text("Facebook",
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: fontSizeExtraLarge,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        top: -30,
                        child: ImageCircle(
                          image: "https://via.placeholder.com/200x500", 
                          radius: 30
                        ),
                      )
                    ],
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