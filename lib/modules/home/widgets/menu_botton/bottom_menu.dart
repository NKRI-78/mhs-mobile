import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/home/bloc/home_bloc.dart';
import 'package:mhs_mobile/router/builder.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key, required this.title, required this.onPressed});

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, st) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: st.profile?.data.isWaitingAprovalAdmin ?? false ? greenColor : null,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25)
          ),
          onPressed: onPressed,
          child: Text(title)
        );
      }
    );
  }
}