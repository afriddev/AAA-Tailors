import 'dart:math';
import 'package:email_sender/email_sender.dart';
class validate{

  ///
  ///
  ///
  /// initialize
  ///
  var mainOtp = Random().nextInt(999999).toString().padLeft(6,'0');


  ///
  /// check email method
  ///
  bool checkEmail(String email) {
    final bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  ///
  /// step1
  String step1(String name,String email){
    if(name.length > 3){
      if(checkEmail(email)){

        return "step1success";
      }
      else{
        return "notValidEmail";
      }
    }
    else {
      return "notValidUserName";
    }}

  ///
  ///
  /// step2
  ///
  ///
  /// """
  // regex pattern for strong password
  //
  // Minimum eight characters, at least one letter and one number:
  // "^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
  // Minimum eight characters, at least one letter, one number and one special character:
  // "^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"
  // Minimum eight characters, at least one uppercase letter, one lowercase letter and one number:
  // "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
  //
  // """
  bool checkPass(dynamic password){
    final bool passwordIsVaild = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password);
    return passwordIsVaild;


  }
  dynamic  step2(String password1,String password2,String email)async{
    if(password1 == password2){

     if(checkPass(password1)){
       try {
         EmailSender emailSender = EmailSender();

         dynamic responseFromEmailServer = await emailSender.sendMessage(email,
             "Ameerunisa Tailors",
             "Sign Up Otp",
             "Your Sign Up Verification Code For Ameerunisa Tailors App is  -  " + mainOtp.toString());
         return mainOtp;

       }
       catch(e){
         print(e);

       }
     }
     else{
       return "passwordIsTooWeak";

     }


    }
    else{
      return "passwordNotMatched";
    }

  }

  ///
  ///
  /// step3
  ///
  ///
  bool checkOtp(dynamic otp,dynamic sendedOtp){
    print(otp);
    print(mainOtp);

    if(otp == sendedOtp){
      return true;
    }
    else{
      return false;
    }
  }

}