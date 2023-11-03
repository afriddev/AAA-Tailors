import 'package:requests/requests.dart';







class updateCount{
  int position;
  String email;
  int value;
  updateCount({
    required this.email,
    required this.value,
    required this.position,
  });
  Future<dynamic> update() async{
    String url = "https://ameerunisatailors.cyclic.cloud/updateParam";
    try{
      var server = await Requests.patch(url,json: {
        "email":email,
        "key":"count",
        "value":value,
        "position":position
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