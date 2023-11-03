import 'package:email_sender/email_sender.dart';
class sendMail{
  var toEmail;
  var subject ;
  var title;
  var body;
  sendMail({
    required this.toEmail,
    required this.subject,
    required this.title,
    required this.body,
});
  dynamic send()async{
    EmailSender emailSender =
        EmailSender();
    dynamic
    responseFromServer =
    await emailSender
        .sendMessage(this
        .toEmail, this.title,
        this.subject, this.body);

    if(responseFromServer['message']
    == "emailSendSuccess"){
      return "success";
    }
    else{
      print(responseFromServer
      ['message']);
      return "serverError";
    }


  }

}