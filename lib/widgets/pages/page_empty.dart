import 'package:flutter/cupertino.dart';
import 'package:mhs_mobile/misc/theme.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key, required this.msg, this.height = .75, this.noImage = true});

  final String msg;
  final double? height;
  final bool? noImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * height!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            noImage! ?
            Image.asset(
              noData,
            ) : const SizedBox.shrink(),
            Text(msg,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.visible,
            style: const TextStyle(
            color: blackColor,
            fontSize: fontSizeLarge,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro')),
          ],
        ),
      ),
    );
  }
}