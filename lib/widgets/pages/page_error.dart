import 'package:flutter/cupertino.dart';
import 'package:mhs_mobile/misc/theme.dart';

class ErorPage extends StatelessWidget {
  const ErorPage({super.key, required this.msg});

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset(
            //   AssetsConst.imageIcNoEvent,
            //   width: 250.0,
            //   height: 250.0,
            // ),
            const SizedBox(
              height: 5,
            ),
            Text(msg,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.visible,
            style: const TextStyle(
            color: whiteColor,
            fontSize: fontSizeLarge,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro')),
          ],
        ),
      ),
    );
  }
}