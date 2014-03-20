library user_listitem_component;

import 'package:angular/angular.dart';

@NgComponent(
    selector : 'userlistitem',
    templateUrl : '../lib/components/user/user_component.html',
    cssUrl: '../lib/components/user/user_component.css',
    publishAs: 'cmpU',
    applyAuthorStyles: true)
class UserListItemComponent{
  @NgAttr('idUser')
  int idUser;
  
  @NgAttr('userName')
  String userName;
  
  @NgAttr('userApellido1')
  String userApellido1;
  
  @NgAttr('userApellido2')
  String userApellido2;
  
  @NgAttr('userCiudad')
  String userCiudad;
  
  @NgAttr('userPuntos')
  int userPuntos;
  
  @NgCallback('onInviteClick')
  Function onInviteClickFunction;
  
  UserListItemComponent();
  
  void invite(){
    Function.apply(onInviteClickFunction, [idUser]);
  }
}
    