



class UserModel{


  final String? id;
  final String fullname;
  final String email;
  final String phoneNo;
  final String password;
  final bool activestatus = false;
  final int imageCategorized = 0;
  final int rewardPoints = 0;



  const UserModel({
    this.id,
    required this.email,
    required this.fullname,
    required this.phoneNo,
    required this.password,

});

  toJson(){
    return{
      "FullName": fullname,
      "Email": email,
      "Phone": phoneNo,
      "rewardPoints": rewardPoints,
      "imageCategorized": imageCategorized,
      "activeStatus": activestatus,
    };
  }


}