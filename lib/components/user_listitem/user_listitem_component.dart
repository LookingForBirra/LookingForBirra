library user_listitem_component;

import 'package:angular/angular.dart';

@NgComponent(
    selector : 'userlistitem',
    templateUrl : '../lib/components/user_listitem/user_listitem_component.html',
    cssUrl: '../lib/components/user_listitem/user_listitem_component.css',
    publishAs: 'cmpU',
    applyAuthorStyles: true)
class UserListItemComponent{
  int id_USER;
  @NgTwoWay('idUser')
  set idUser(int id) {
    //id==null || id=="" ? id_USER = -1 : id_USER = int.parse(id);
    id_USER = id;
  }
  
  int get idUser => id_USER;
  
  @NgTwoWay('userName')
  String userName;
  
  @NgTwoWay('userApellido1')
  String userApellido1;
  
  @NgTwoWay('userApellido2')
  String userApellido2;
  
  @NgTwoWay('userCiudad')
  String userCiudad;
  
  int userPuntuacion;
  @NgTwoWay('userPuntos')
  set userPuntos(int puntos){
    //puntos == null || puntos=="" ? userPuntuacion = 0 : userPuntuacion = int.parse(puntos);
    userPuntuacion = puntos;
  }
  
  int get userPuntos => userPuntuacion;
  
  UserListItemComponent();
}
    