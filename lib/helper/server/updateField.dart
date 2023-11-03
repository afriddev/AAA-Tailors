import 'package:requests/requests.dart';
class updateField{
  String email;
  String key;
  String value;
  updateField({
  required this.email,
  required this.key,
  required this.value,
  });
  Future<dynamic> update() async{
    String url = "https://ameerunisatailors.cyclic.cloud/updateParam";
    try{
      var server = await Requests.patch(url,json: {
      "email":email,
      "key":key,
      "value":value
    });
    dynamic responseFromServer = server.json();
    if(responseFromServer["message"] == "updateCompleted")return "updateCompleted";
    else if(responseFromServer["message"] == "wrongKey")return "enteredWrongKey";
    else if(responseFromServer["message"] == "updateError")return "updateFailed";
    else if(responseFromServer["message"] == "userNotFound")return "userNotFound";
    else return "someThingWentWrong";

    }
    catch(e){
      return "someThingWentWrong";
    }
  }
}