library friendscontroller;

import 'dart:html';
import 'package:angular/angular.dart';
import 'package:LookingForBirra/user.dart';


@NgController(
    selector: '[friends-list]',
    publishAs: 'ctrlF')
class FriendsController {
  List<User> friendsList;
  bool friendChosen;
  Http _http;
  
  static String _databaseUrl = 'http://lookingforbirra.esy.es/friends_db_access.php';
  
  FriendsController(Http this._http);
  
  void loadData() {
    /*
    userList = new List<User>();
    _http.get(_databaseUrl).then((HttpResponse response){
      print(response);
      for(Map m in response.data){
        userList.add(new User.fromJson(m));
      }
    });*/
    friendsList = <User>[new User(1, "Manuel", "Martin", "Muñoz", "Granada", 100),
                      new User(2, "Jose", "Jimenez", "Jeronimo", "Granada", 200),
                      new User(3, "Alvaro", "Anguita", "Aragon", "Malaga", 150)];
  }
  
  void changeView(int id){
    var chosenFriendElement = querySelector('#chosenFriend');
    User userChosen;
    for(User friend in friendsList){
      if(friend.id_USER == id)
        userChosen = friend;
    }
    
    chosenFriendElement.attributes = <String, String>{
      'idUser' : userChosen.id_USER.toString(),
      'userName' : userChosen.nombre,
      'userApellido1' : userChosen.apellido1,
      'userApellido2' : userChosen.apellido2,
      'userCiudad' : userChosen.ciudad,
      'userPuntos' : userChosen.puntos.toString()
    };
    
    friendChosen = true;
  }
}