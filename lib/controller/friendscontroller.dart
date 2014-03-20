library friendscontroller;

import 'package:angular/angular.dart';
import 'package:LookingForBirra/user.dart';


@NgController(
    selector: '[friends-list]',
    publishAs: 'ctrlF')
class FriendsController {
  List<User> barList;
  Http _http;
  
  static String _databaseUrl = 'http://lookingforbirra.esy.es/friends_db_access.php';
  
  FriendsController(Http this._http);
  
  void loadData() {
    barList = new List<User>();
    _http.get(_databaseUrl).then((HttpResponse response){
      print(response);
      for(Map m in response.data){
        barList.add(new User.fromJson(m));
      }
    });
  }
}