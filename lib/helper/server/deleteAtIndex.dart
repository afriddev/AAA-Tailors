import 'package:requests/requests.dart';
class deleteAtIndex{
  String email;
  String key;
  int  position;
  deleteAtIndex({
  required this.email,
  required this.key,
  required this.position,
  });
  Future<dynamic> delete() async{
    try{
      String url = "https://ameerunisatailors.cyclic.cloud/deleteIndex";
    var server = await Requests.delete(url,json: {
      "email":email,
      "key":key,
      "position":position
    });
    dynamic responseFromServer = server.json();
     if(responseFromServer["message"] == "deleteSuccess")return "deleteSuccess";
    else if(responseFromServer["message"] == "keyError")return "enteredWrongKey";
    else if(responseFromServer["message"] == "deleteError")return "deleteFailed";
    else if(responseFromServer["message"] == "userNotFound")return "userNotFound";
    else return "someThingWentWrong";
    }
    catch(e){
      return "someThingWentWrong";
    }
}
}