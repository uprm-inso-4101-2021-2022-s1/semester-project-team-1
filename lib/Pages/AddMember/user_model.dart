//User Model
class UserModel {
  String firstName;
  String lastName;
  String email;
  String password;
  String contractType;
  String homeAddress;
  String dateOfBirth;
  String height;
  String inquiry;
  String phoneNumber;
  String memberID;
  String direction;
  String nextPayDate;
  String payAmount;
  String billingDate;
  String receipts;
  String signDate;
  String uid;
  String initialWeight;
  String currentWeight;
  String status;

  UserModel(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.contractType,
      this.homeAddress,
      this.dateOfBirth,
      this.height,
      this.inquiry,
      this.phoneNumber,
      this.memberID,
      this.direction,
      this.nextPayDate,
      this.payAmount,
      this.billingDate,
      this.receipts,
      this.signDate,
      this.uid,
      this.initialWeight,
      this.currentWeight,
      this.status});

  factory UserModel.fromMap(Map data) {
    return UserModel(
      //for uid no ?? ''

      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      email: data['email'] ?? '',
      password: data['password'] ?? '',
      contractType: data['contractType'] ?? '',
      homeAddress: data['homeAddress'] ?? '',
      dateOfBirth: data['dateOfBirth'] ?? '',
      height: data['height'] ?? '',
      inquiry: data['inquiry'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      memberID: data['memberID'] ?? '',
      direction: data['direction'] ?? '',
      nextPayDate: data['nextPayDate'] ?? '',
      payAmount: data['payAmount'] ?? '',
      billingDate: data['billingDate'] ?? '',
      receipts: data['receipts'] ?? '',
      signDate: data['signDate'] ?? '',
      uid: data['uid'],
      initialWeight: data['initialWeight'] ?? '',
      currentWeight: data['currentWeight'] ?? '',
      status: data['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "contractType": contractType,
        "homeAddress": homeAddress,
        "dateOfBirth": dateOfBirth,
        "height": height,
        "inquiry": inquiry,
        "phoneNumber": phoneNumber,
        "memberID": memberID,
        "direction": direction,
        "nextPayDate": nextPayDate,
        "payAmount": payAmount,
        "billingDate": billingDate,
        "receipts": receipts,
        "signDate": signDate,
        "uid": uid,
        "initialWeight": initialWeight,
        "currentWeight": currentWeight,
        "status": status,
      };
}


/*
   firstName
   lastName
   verified
   email
   password
   prefPaymentMethod
   contractType
   direction
   dateOfBirth
   height
   inquiry
   phoneNumber
   memberID
   nextPayDate
   payAmount
   billingDate
   receipts
   signDate
   uid
   initialWeight
   currentWeight

   */