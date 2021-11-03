import 'package:acropolis_member_management/Pages/AddMember/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loading.dart';

//MISSING HOME ADRESS FIELD

class AuthController extends GetxController {
  static AuthController to = Get.put(AuthController());

  //Account create info
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController contractTypeController = TextEditingController();
  TextEditingController homeAddressController = TextEditingController();
  TextEditingController directionController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController inquiryController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController memberIDController = TextEditingController();
  TextEditingController nextPayDateController = TextEditingController();
  TextEditingController payAmountController = TextEditingController();
  TextEditingController billingDateController = TextEditingController();
  TextEditingController receiptsController = TextEditingController();
  TextEditingController signDateController = TextEditingController();
  TextEditingController uidController = TextEditingController();
  TextEditingController initialWeightController = TextEditingController();
  TextEditingController currentWeightController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Rx<User> firebaseUser = Rx<User>();
  Rx<UserModel> firestoreUser = Rx<UserModel>();
  final RxBool admin = false.obs;
  //final int memberIDgenerator = ;
  @override
  void onReady() async {
    //run every time auth state changes
    ever(firebaseUser, handleAuthChanged);
    firebaseUser.value = await getUser;
    firebaseUser.bindStream(user);
    super.onReady();
  }

  @override
  void onClose() {
    firstNameController?.dispose();
    lastNameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    contractTypeController?.dispose();
    homeAddressController?.dispose();
    dateOfBirthController?.dispose();
    directionController?.dispose();
    heightController?.dispose();
    inquiryController?.dispose();
    phoneNumberController?.dispose();
    memberIDController?.dispose();
    nextPayDateController?.dispose();
    payAmountController?.dispose();
    billingDateController?.dispose();
    receiptsController?.dispose();
    signDateController?.dispose();
    uidController?.dispose();
    initialWeightController?.dispose();
    currentWeightController?.dispose();

    /*nameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    */
    super.onClose();
  }

  handleAuthChanged(_firebaseUser) async {
    //get user data from firestore
    if (_firebaseUser?.uid != null) {
      firestoreUser.bindStream(streamFirestoreUser());
      await isAdmin();
    }

    // if (_firebaseUser == null) {
    //    Get.offAll(InitialScreen()); //(SignInUI());
    // } else {
    //    Get.offAll(VerifyScreen()); //(HomeUI());
    //  }
  }

  // Firebase user one-time fetch
  Future<User> get getUser async => _auth.currentUser;

  // Firebase user a realtime stream
  Stream<User> get user => _auth.authStateChanges();

  //Streams the firestore user from the firestore collection
  Stream<UserModel> streamFirestoreUser() {
    print('streamFirestoreUser()');
    if (firebaseUser?.value?.uid != null) {
      return _db
          .doc('/users/${firebaseUser.value.uid}')
          .snapshots()
          .map((snapshot) => UserModel.fromMap(snapshot.data()));
    }

    return null;
  }

  //get the firestore user from the firestore collection
  Future<UserModel> getFirestoreUser() {
    if (firebaseUser?.value?.uid != null) {
      return _db.doc('/users/${firebaseUser.value.uid}').get().then(
          (documentSnapshot) => UserModel.fromMap(documentSnapshot.data()));
    }
    return null;
  }

  //Method to handle user sign in using email and password
  signInWithEmailAndPassword(BuildContext context) async {
    showLoadingIndicator();
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      emailController.clear();
      passwordController.clear();
      hideLoadingIndicator();
    } catch (error) {
      hideLoadingIndicator();
      Get.snackbar("labels.auth.signInErrorTitle", "labels.auth.signInError",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 7),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  //Loading counter value on start

  // User registration using email and password on app
  // If using the iPad for member signup in the gym, then create a new function in
  // order to add missing fields such as direction, contract type, exc.
  registerWithEmailAndPassword(BuildContext context) async {
    showLoadingIndicator();
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((result) async {
        print('uID: ' + result.user.uid);
        print('email: ' + result.user.email);

        //Verified starts in false in order to validate manually
        //Initial values are as follows
        String status = "Active";
        //String billingDate = "notAssigned";

        var signDate = DateTime.now().toString();

        //create the new user object
        UserModel _newUser = UserModel(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
          contractType: contractTypeController.text,
          homeAddress: homeAddressController.text,
          dateOfBirth: dateOfBirthController.text,
          height: heightController.text,
          inquiry: inquiryController.text,
          phoneNumber: phoneNumberController.text,
          memberID: memberIDController.text,
          direction: directionController.text,
          nextPayDate: nextPayDateController.text,
          payAmount: payAmountController.text,
          billingDate: billingDateController.text,
          receipts: receiptsController.text,
          signDate: signDate,
          uid: result.user.uid,
          initialWeight: initialWeightController.text,
          currentWeight: currentWeightController.text,
          status: status,
        );
        //create the user in firestore
        _createUserFirestore(_newUser, result.user);

        firstNameController.clear();
        lastNameController.clear();
        emailController.clear();
        passwordController.clear();
        contractTypeController.clear();
        homeAddressController.clear();
        dateOfBirthController.clear();
        heightController.clear();
        inquiryController.clear();
        phoneNumberController.clear();
        memberIDController.clear();
        nextPayDateController.clear();
        payAmountController.clear();
        billingDateController.clear();
        receiptsController.clear();
        signDateController.clear();
        uidController.clear();
        initialWeightController.clear();
        currentWeightController.clear();
        statusController.clear();

        hideLoadingIndicator();
      });
    } catch (error) {
      hideLoadingIndicator();
      Get.snackbar("labels.auth.signUpErrorTitle", "error.message",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  //handles updating the user when updating profile
  Future<void> updateUser(BuildContext context, UserModel user, String oldEmail,
      String password) async {
    try {
      showLoadingIndicator();
      await _auth
          .signInWithEmailAndPassword(email: oldEmail, password: password)
          .then((_firebaseUser) {
        _firebaseUser.user
            .updateEmail(user.email)
            .then((value) => _updateUserFirestore(user, _firebaseUser.user));
      });
      hideLoadingIndicator();
      Get.snackbar("labels.auth.updateUserSuccessNoticeTitle",
          "labels.auth.updateUserSuccessNotice",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 5),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    } on PlatformException catch (error) {
      //List<String> errors = error.toString().split(',');
      // print("Error: " + errors[1]);
      hideLoadingIndicator();
      print(error.code);
      String authError;
      switch (error.code) {
        case 'ERROR_WRONG_PASSWORD':
          authError = "labels.auth.wrongPasswordNotice";
          break;
        default:
          authError = "labels.auth.unknownError";
          break;
      }
      Get.snackbar("labels.auth.wrongPasswordNoticeTitle", authError,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  //updates the firestore user in users collection
  void _updateUserFirestore(UserModel user, User _firebaseUser) {
    _db.doc('/users/${_firebaseUser.uid}').update(user.toJson());
    update();
  }

  //create the firestore user in users collection
  void _createUserFirestore(UserModel user, User _firebaseUser) {
    _db.doc('/users/${_firebaseUser.uid}').set(user.toJson());
    update();
  }

  //password reset email
  Future<void> sendPasswordResetEmail(BuildContext context) async {
    showLoadingIndicator();
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
      hideLoadingIndicator();
      Get.snackbar('labels.auth.resetPasswordNoticeTitle',
          'labels.auth.resetPasswordNotice',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 5),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    } catch (error) {
      hideLoadingIndicator();
      Get.snackbar('labels.auth.resetPasswordFailed', error.message,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  //check if user is an admin user
  isAdmin() async {
    await getUser.then((user) async {
      DocumentSnapshot adminRef =
          await _db.collection('admin').doc(user?.uid).get();
      if (adminRef.exists) {
        admin.value = true;
      } else {
        admin.value = false;
      }
      update();
    });
  }

  // Sign out
  Future<void> signOut() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
    contractTypeController.clear();
    homeAddressController.clear();
    dateOfBirthController.clear();
    heightController.clear();
    inquiryController.clear();
    phoneNumberController.clear();
    memberIDController.clear();
    nextPayDateController.clear();
    payAmountController.clear();
    billingDateController.clear();
    receiptsController.clear();
    signDateController.clear();
    uidController.clear();
    initialWeightController.clear();
    currentWeightController.clear();
    statusController.clear();

    return _auth.signOut();
  }
}

//removed prefPaymentMethodController
//removed verifiedController
