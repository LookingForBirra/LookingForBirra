library user_listitem_component;

import 'package:LookingForBirra/user.dart';
import 'package:angular/angular.dart';

@NgComponent(
    selector : 'user',
    templateUrl : '../lib/components/user/user_component.html',
    cssUrl: '../lib/components/user/user_component.css',
    publishAs: 'cmpU',
    applyAuthorStyles: true)
class UserListComponent{
  List<User> listUsers;
  Http _http;
  
  UserListComponent(Http this._http);
  
  @NgAttr('idUser')
  set idUser(int id){
    _loadData(id);
  }
  
  void _loadData(int id){
    //TODO sacarlo del backend en lugar de esto
    listUsers = <User> [new User(id, "Jose", "Plata", "Muñoz", "Graná", 100),
                        new User(id, "Jose", "Plata", "Muñoz", "Graná", 100),
                        new User(id, "Jose", "Plata", "Muñoz", "Graná", 100)];
  }
}
    