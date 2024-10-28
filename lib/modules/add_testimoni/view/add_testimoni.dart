import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/add_testimoni/cubit/add_testimoni_cubit.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/textfield/textfield.dart';

part '../widget/input_caption.dart';
part '../widget/input_msg.dart';
part '../widget/_bottom_button.dart';
part '../widget/input_image.dart';

final GlobalKey<FormState> _formTestimoni = GlobalKey<FormState>();

class AddTestimoniPage extends StatelessWidget {
  const AddTestimoniPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddTestimoniCubit>(
      create: (context) => AddTestimoniCubit(),
      child: const AddTestimoniView(),
    );
  }
}

class AddTestimoniView extends StatelessWidget {
  const AddTestimoniView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          const HeaderSection(
            title: "Buat Testimoni", 
            isCircle: true,
            isPrimary: false,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10.0),
            sliver: SliverList.list(
              children: [
                Form(
                  key: _formTestimoni,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputMsg(),
                      InputImage(),
                      _BottomButon(),
                    ],
                  ),
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}