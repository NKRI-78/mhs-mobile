part of '../view/event_page.dart';

class TabeleCalendarPage extends StatefulWidget {
  const TabeleCalendarPage({super.key});

  @override
  State<TabeleCalendarPage> createState() => _TabeleCalendarPageState();
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class _TabeleCalendarPageState extends State<TabeleCalendarPage> {
  List<DateRangeModel> data = [];

  List<Map<String, dynamic>> _selectedEvents = [];
  List<Map<String, dynamic>> get selectedEvents => [..._selectedEvents];

  Map<DateTime, List<Map<String, dynamic>>> events = {};

  DateTime selectedDate = DateTime.now();

  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();

  void loopEvent() {
  data = [];
  for (EventResult el in getIt<EventBloc>().state.event) {
    data.add(DateRangeModel(
      startDate: DateTime(DateTime.parse(el.startDate).year, DateTime.parse(el.startDate).month, DateTime.parse(el.startDate).day),
      endDate: DateTime(DateTime.parse(el.endDate).year, DateTime.parse(el.endDate).month,  DateTime.parse(el.endDate).day),
      dataArray: [{
        "id": el.id,
        "title": el.title,
        "picture": el.imageUrl,
        "description": el.description,
        "start": el.start,
        "end": el.end,
        "startDate": el.startDate,
        "endDate": el.endDate,
        "location": el.address,
        "created_at": el.createdAt,
        "is_expired": el.isExpired,
        "is_joined": el.isJoin,
      }]
    ));

      Map<DateTime, List<Map<String, dynamic>>> groupedData = groupDataByDate(data);

    groupedData.forEach((date, dataArray) {
      events[date] = dataArray;
    });

    if(groupedData.isNotEmpty) {
      for (var el in groupedData.entries) {
        if(DateFormat('dd/MM/yyyy').format(el.key) == DateFormat('dd/MM/yyyy').format(DateTime.now())) {
          _selectedEvents = el.value;
        }}

      }
    }
  }

  Future<void> getData() async {
    getIt<EventBloc>().state.event;
    selectedDay = focusedDay;
    loopEvent();
  }

  void setInitialEvent() {
    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        setState(() {});
      },
    );
  }

  List<Map<String, dynamic>>  getEventsForDay(DateTime day) {
     loopEvent();
    final kEvents = LinkedHashMap<DateTime, List<Map<String, dynamic>>>(
      equals: isSameDay,
      hashCode: DateUntil.getHashCode,
    )..addAll(events);
    return kEvents[day] ?? [];

  }

  void addSelectedEvents(List<Map<String, dynamic>> events) {
    setState(() {
    _selectedEvents = events;
    });
  }

  void updateSelectedDate(DateTime selectedDateParam) {
    setState(() {
      selectedDate = selectedDateParam;
    });
  }

  void onDaySelected(DateTime selectedDayParam, DateTime focusedDayParam) {
    if (!isSameDay(selectedDay, selectedDayParam)) {
      setState(() {
        selectedDay = selectedDayParam;
        focusedDay = focusedDayParam;
      });
      updateSelectedDate(selectedDayParam);
      addSelectedEvents(getEventsForDay(selectedDayParam));
      // debugPrint("Select ${getEventsForDay(selectedDayParam)}");
    }
  }

  @override
  void initState() {
    super.initState();

    Future.wait([
      getData(),
    ]);

    setInitialEvent();
  }

  @override
  void dispose() {
    // getIt<HomeBloc>().add(HomeReadAllEvent()); 
    // getIt<HomeBloc>().add(HomeRefreshForum());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: primaryColor,
          ),
          child: TableCalendar(
                // locale: const Locale('id', 'ID').toString(),
                eventLoader: (day) {
                  return getEventsForDay(day);
                },
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: const CalendarStyle(
                  defaultTextStyle: TextStyle(
                    color: whiteColor
                  ),
                  weekendTextStyle: TextStyle(
                    color: redColor
                  ),
                ),
                onDaySelected: onDaySelected,
                selectedDayPredicate: (DateTime day) => isSameDay(selectedDay, day),
                onPageChanged: (val) {
                  focusedDay = val;
                },
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekendStyle: TextStyle(
                    color: redColor
                  ),
                  weekdayStyle: TextStyle(
                    color: whiteColor
                  ),
                ),
                daysOfWeekHeight: 50,
                weekendDays: const [DateTime.sunday],
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonShowsNext: false,
                  formatButtonVisible : false,
                  headerMargin: const EdgeInsets.symmetric(vertical: 10),
                  titleTextStyle: const TextStyle(
                    fontSize: fontSizeLarge,
                    color: whiteColor
                  ),
                  leftChevronIcon: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 10,
                      opticalSize: 20,
                    ),
                  ),
                  rightChevronIcon: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 10,
                    ),
                  ),
                ),
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: focusedDay,
                calendarFormat: CalendarFormat.month,
                 calendarBuilders: CalendarBuilders(
                    markerBuilder: (BuildContext context, DateTime dateTime, data) {
                    if(data.isNotEmpty) {
                      return Stack(
                      fit: StackFit.expand,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: const Center(),
                        ),
                        Positioned(
                          right: 2,
                          child: SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: Image.asset(
                              "assets/icons/star-icon.png",
                            ),
                          ),
                        ),
                      ],
                    );
                    }
                    return Container();
                  },
                ),
              ),
        ),
        buildCalenderValueListener(),
      ],
    );
  }

  Widget buildCalenderValueListener() {
    return ListView.builder(
      physics: const ScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: selectedEvents.length,
      itemBuilder: (context, idx) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: CardEvent(
            id: (selectedEvents[idx]['id']), 
            title: selectedEvents[idx]['title'], 
            image: selectedEvents[idx]['picture'], 
            deskription: selectedEvents[idx]['description'],
            address: selectedEvents[idx]['location'],
            isJoined: selectedEvents[idx]['is_joined'],
            isExpired: selectedEvents[idx]['is_expired'],
            startDate: DateUntil.formatDateEvent(DateTime.parse(selectedEvents[idx]['startDate'])
            ),
          ),
        );
      },
    );
  }
}