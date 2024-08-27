import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';

class CardEvent extends StatelessWidget {
  const CardEvent({super.key, required this.title, required this.image, required this.deskription, required this.address, required this.startDate, required this.id, required this.isExpired, required this.isJoined});

  final int id;
  final String title;
  final String image;
  final String deskription;
  final String address;
  final String startDate;
  final bool isJoined;
  final bool isExpired;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
          EventDetailRoute(idEvent: id).push(context);
      },
      child: SizedBox(
        width: double.infinity,
        height: isJoined || isExpired ? 120 : 90,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  isJoined || isExpired ? Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: !isJoined ? redColor : greenColor,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            !isJoined ? "Sudah Berakhir" : "Sudah Bergabung",
                            style: const TextStyle(
                              color: whiteColor,
                              fontSize: fontSizeSmall
                            ),
                          ),
                        ),
                      ],
                    ),
                  ) : Container(),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20)),
                    child: ImageCard(
                      image: image,
                      radius: 15, 
                      height: 90, 
                      width: double.infinity, 
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                height: 90,
                decoration: const BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), topRight: Radius.circular(20))
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        style: const TextStyle(
                          color: blackColor,
                          fontSize: fontSizeLarge,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.visible
                        ),
                      ),
                      Text(
                        deskription,
                        maxLines: 3,
                        style: const TextStyle(
                          color: blackColor,
                          fontSize: fontSizeExtraSmall,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.visible
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            address,
                            style: const TextStyle(
                              fontSize: fontSizeExtraSmall
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.date_range,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            startDate,
                            style: const TextStyle(
                              fontSize: fontSizeExtraSmall
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}