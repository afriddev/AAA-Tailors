import 'package:requests/requests.dart';
class getUser{
  String email;
  getUser({
    required this.email
  });
  Future<dynamic> findUser() async{
    String url = "https://ameerunisatailors.cyclic.cloud/getUser/${email}";
    try{
      var server = await Requests.get(url);
    var responseFromServer = server.json();
    if(responseFromServer["message"] == "findedUser")return responseFromServer["user"];
    else if(responseFromServer["message"] == "notFound")return "userNotFound";
    else if(responseFromServer["message"] == "emailError")return "ProvideCorrectEmail";
    else return "someThingWentWrong";
  }
    
    catch(e){
      return "someThingWentWrong";
    }
}
}
void main() async{
  print(await getUser(email: "afridayan01@gmaadsil.com").findUser());
}

