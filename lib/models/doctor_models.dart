
class DoctorDate {
  String dDId;
  String time;
  String date;
  bool done;


  DoctorDate({
    this.dDId = '',
    this.time = '',
    this.date = '',
    this.done = false
  });
}

class DoctorDates {
  String dateId;
  String doctorName;
  String doctorPN;
  String type;
  String time;
  String date;
  String location;
  int done;
  List<DoctorDate> datesList;

  DoctorDates({
    this.dateId = "",
    this.doctorName = '',
    this.doctorPN = '',
    this.type = '',
    this.time = '',
    this.date = '',
    this.location = '',
    this.done = 0,
    this.datesList = const []
  });

  factory DoctorDates.fromMap(Map<String, dynamic> map) {
    return DoctorDates(
        dateId: map['orderId'] ?? '',

        datesList: map['datesList'] ?? []
    );
  }

  static Map<String, dynamic> toMap(DoctorDates ordersDetails) => {
    "orderId": ordersDetails.dateId,

    "datesList" : ordersDetails.datesList
  };
}