import 'package:requests/requests.dart';
class pushArray{
  String email;
  String key;
  dynamic  value;
  pushArray({
  required this.email,
  required this.key,
  required this.value,
  });
  Future<dynamic> push() async{
    String url = "https://ameerunisatailors.cyclic.cloud/pushArray";
    try{
      var server = await Requests.put(url,json: {
      "email":email,
      "key":key,
      "value":value
    });
    dynamic responseFromServer = server.json();
     if(responseFromServer["message"] == "pushSuccess")return "pushSuccess";
    else if(responseFromServer["message"] == "keyError")return "enteredWrongKey";
    else if(responseFromServer["message"] == "pushError")return "pushFailed";
    else if(responseFromServer["message"] == "userNotFound")return "userNotFound";
    else return "someThingWentWrong";

    }
    catch(e){
      return "someThingWentWrong";
    }
}
}