import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/detail_event/cubit/event_detail_cubit.dart';

class JoinButton extends StatelessWidget {
  const JoinButton({
    super.key,
    required this.joined,
    required this.isExpired,
    required this.onPressed,
  });

  final bool joined;
  final bool isExpired;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDetailCubit, EventDetailState>(
      builder: (context, state) {
        return state.event?.data == null ? Container() : Align(
          alignment: Alignment.bottomCenter,
          child: joined || isExpired ? Container(
          width: double.infinity,
          height: 70,
          color: joined ? primaryColor : errorColor,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          child: Text(joined ? "Anda telah bergabung dengan event ini" : "Event ini telah berakhir", 
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: whiteColor,
              fontSize: fontSizeLarge,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF Pro'
          )),
        )  : Container(
            width: double.infinity,
            height: 51,
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: greenColor,
              ), 
              child: const Text(
                "Join Event"
              )
            ),
          ),
        );
      }
    );
  }
}