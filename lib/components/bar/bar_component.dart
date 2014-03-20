library bar_component;

import 'package:LookingForBirra/bar.dart';
import 'package:angular/angular.dart';

@NgComponent(
    selector: 'bar',
    templateUrl: '../lib/components/bar/bar_component.html',
    cssUrl: '../lib/components/bar/bar_component.css',
    publishAs: 'cmpB',
    applyAuthorStyles: true)
class BarComponent {
  Bar currentBar;
  Http _http;
  
  BarComponent() {
  }

  @NgAttr('id_BAR')
  set id_BAR(int id) {
    _loadBar(id);
  }

  void _loadBar(int id) {
    var url = 'http://lookingforbirra.esy.es/bar_db_access.php';
    _http.get(url, params : <String,dynamic>{'id_BAR': id}).then((HttpResponse response){
      print(response);
      currentBar = new Bar.fromJson(response.data);
    });
  }
}