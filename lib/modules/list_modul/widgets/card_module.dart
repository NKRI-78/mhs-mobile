import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/repositories/document_repository/models/document_model.dart';
import 'package:mhs_mobile/router/builder.dart';

class CardModul extends StatelessWidget {
  const CardModul({super.key, required this.document});

  final DocumentData document;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(10)),
                      color: document.fileUrl?.split('.').last == "pdf" ? redColor : primaryColor
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          document.fileUrl?.split('.').last.toUpperCase() ?? "PDF",
                          style: const TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  )
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      document.title ?? "",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
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
                    onPressed: (){
                      ModulShowPdfRoute(url: document.fileUrl ?? "", title: document.title ?? "",).go(context);
                    }, 
                    child: const Text(
                      'Lihat',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSizeSmall,
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