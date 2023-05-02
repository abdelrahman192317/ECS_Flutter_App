
class User {
  String userId;
  String imgPath;
  String storeName;
  String storeLocation;
  String userName;
  String email;
  String password;
  String userPN;

  User({
    this.userId = "",
    this.userName = "",
    this.imgPath = "",
    this.email = "",
    this.password = "",
    this.userPN = "",
    this.storeName = "",
    this.storeLocation = ""
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['orderNum'] ?? '',
      userName: map['title'] ?? '',
      imgPath: map['time'] ?? '',
      email: map['position'] ?? '',
      password: map['driverName'] ?? '',
      userPN: map['driverPhoneNum'] ?? '',
      storeName: map['by'] ?? '',
      storeLocation: map['by'] ?? '',
    );
  }

  static Map<String, dynamic> toMap(User user, String authId) => {
    "authId": authId,
    "userName": user.userName,
    "imgPath": user.imgPath,
    "email": user.email,
    "password": user.password,
    "userPN": user.userPN,
    "storeName": user.storeName,
    "storeLocation": user.storeLocation,
  };
}
