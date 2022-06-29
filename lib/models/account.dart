class UserAccount {
  final int userId;
  final String? userMail;
  final String? userName;
  final String? userPhonenumber;
  final String? userProfileimagepath;
  final String? userCurrentAddress;
  final String? userPermanentAddress;

  UserAccount(
    this.userId,
    this.userMail,
    this.userName,
    this.userPhonenumber,
    this.userProfileimagepath,
    this.userCurrentAddress,
    this.userPermanentAddress,
  );
  factory UserAccount.fromJson(Map<String, dynamic> json) {
    return UserAccount(
        json["userId"],
        json["userMail"],
        json["userName"],
        json["userPhonenumber"],
        json["userProfileimagepath"],
        json["userCurrentAddress"],
        json["userPermanentAddress"]);
  }
  factory UserAccount.fromMap(Map<String, dynamic> json) {
    return UserAccount(
        json["userId"],
        json["userMail"],
        json["userName"],
        json["userPhonenumber"],
        json["userProfileimagepath"],
        json["userCurrentAddress"],
        json["userPermanentAddress"]);
  }
}
