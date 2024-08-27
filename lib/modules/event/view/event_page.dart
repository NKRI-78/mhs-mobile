import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mhs_mobile/misc/injections.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/event/bloc/event_bloc.dart';
import 'package:mhs_mobile/modules/event/models/date_range_model.dart';
import 'package:mhs_mobile/modules/event/widget/_card_event.dart';
import 'package:mhs_mobile/repositories/event_repository/models/event_model.dart';
import 'package:mhs_mobile/widgets/extension/date_util.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:table_calendar/table_calendar.dart';

part '../widget/_table_calendar.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<EventBloc>()..add(EventInitial()),
      child: const EventView(),
    );
  }
}

class EventView extends StatelessWidget {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        slivers: [
          const HeaderSection(
            title: "Event", 
            isCircle: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const TabeleCalendarPage(),
            ])
          )
        ]
      ),
    );
  }
}