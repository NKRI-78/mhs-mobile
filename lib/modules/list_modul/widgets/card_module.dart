import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/repositories/document_repository/models/document_model.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';

class CardModul extends StatelessWidget {
  const CardModul({super.key, required this.document});

  final DocumentData document;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: ImageCard(
                    image: "https://via.placeholder.com/39x48", 
                    radius: 0, 
                    width: double.infinity,
                  )
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          document.title ?? "",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '12 Juli 2024 | 07:30',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6000000238418579),
                            fontSize: 11,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex:2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    onPressed: (){}, 
                    child: const Text(
                      'View',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      )
                    )
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 0.4,
            color: blackColor,
          )
        ],
      ),
    );
  }
}