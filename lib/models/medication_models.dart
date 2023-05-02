
class MedicationDate {
  String mDId;
  String time;
  String date;
  bool done;


  MedicationDate({
    this.mDId = '',
    this.time = '',
    this.date = '',
    this.done = false
  });
}

class MedicationDates {
  String dateId;
  String title;
  String desc;
  String type;
  String doctorName;
  String imageUrl;
  String startTime;
  String startDate;
  String endDate;
  int done;
  List<MedicationDate> datesList;

  MedicationDates({
    this.dateId = "",
    this.title = "",
    this.desc = '',
    this.type = '',
    this.doctorName = '',
    this.imageUrl = '',
    this.startTime = "",
    this.startDate = "",
    this.endDate = '',
    this.done = 0,
    this.datesList = const []
  });

  factory MedicationDates.fromMap(Map<String, dynamic> map) {
    return MedicationDates(
      dateId: map['orderId'] ?? '',
      title: map['title'] ?? '',
      startTime: map['time'] ?? '',
      startDate: map['date'] ?? '',
      datesList: map['datesList'] ?? []
    );
  }

  static Map<String, dynamic> toMap(MedicationDates ordersDetails) => {
    "orderId": ordersDetails.dateId,
    "title": ordersDetails.title,
    "time": ordersDetails.startTime,
    "date": ordersDetails.startDate,
    "datesList" : ordersDetails.datesList
  };
}