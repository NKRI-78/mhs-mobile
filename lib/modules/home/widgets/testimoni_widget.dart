import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/widgets/images/image_circle.dart';

class TestimoniWidget extends StatelessWidget {
  const TestimoniWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text(
                'Testimoni',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                'See All',
                style: TextStyle(
                  color: redColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: testimoniColor,
                  borderRadius: BorderRadius.circular(16)
                ),
                width: 200,
                height: 150,
                child: Stack(
                  fit: StackFit.loose,
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text("Kayle",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: blackColor,
                                fontSize: fontSizeExtraSmall,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text('Proud to be MHS Bandar Lampung, Saya dapat bekerja di Marriot Al Forsan Abu Dhabi, Terimakasih MHS..... ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: blackColor.withOpacity(0.80),
                              fontSize: fontSizeExtraSmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      left: 0,
                      top: -50,
                      child: ImageCircle(
                        image: "https://lh6.googleusercontent.com/proxy/x7p0nSd1QwTKh3R0kq5SQmVHwasi0Vu8RpJ0sqk9XrXMh0VFv_kOetfUl53heELED1__FdFwQWiK9PWPLVUwL82ZQ3VJaPpOE6ni8BdoBg32JLckVSrg1B0", 
                        radius: 50
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}