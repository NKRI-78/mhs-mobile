class DateRangeModel {
  DateTime startDate;
  DateTime endDate;
  List<Map<String, dynamic>> dataArray;

  DateRangeModel({required this.startDate, required this.endDate, required this.dataArray});
}

Map<DateTime, List<Map<String, dynamic>>> groupDataByDate(List<DateRangeModel> data) {
  Map<DateTime, List<Map<String, dynamic>>> groupedData = {};

  for (var dateModel in data) {
    DateTime currentDate = dateModel.startDate;

    while (currentDate.isBefore(dateModel.endDate) || currentDate.isAtSameMomentAs(dateModel.endDate)) {
      groupedData.putIfAbsent(currentDate, () => []);
      groupedData[currentDate]!.addAll(dateModel.dataArray);
      currentDate = currentDate.add(const Duration(days: 1));
    }
  }

  return groupedData;
}