import 'package:flutter/material.dart';
import 'package:mhs_mobile/misc/theme.dart';

class ListSetting extends StatefulWidget {
  const ListSetting({super.key, required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  State<ListSetting> createState() => _ListSettingState();
}

class _ListSettingState extends State<ListSetting> {
  @override 
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              widget.title,
              style: const TextStyle(
                color: blackColor,
              ),
            ),
          ),
          Divider( 
            thickness: 1,
            color: blackColor.withOpacity(0.5)
          )
        ],
      ),
    );
  }
}