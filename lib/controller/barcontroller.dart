import 'package:angular/angular.dart';
import 'package:LookingForBirra/bar.dart';


@NgController(
    selector: '[bar-list]',
    publishAs: 'ctrl')
class BarListController {
  List<Bar> barList;
  Http _http;
  
  BarListController(Http this._http) {
    _loadData();
  }
  
  void _search(String tipo, String valor){
    barList = new List<Bar>();
    var url = 'http://lookingforbirra.esy.es/bar_db_access.php';
    Map args = { 'tipoBusqueda' : tipo,
                 'valorBusqueda' : valor};
    _http.get(url).then((HttpResponse response){
      print(response);
      for(Map m in response.data){
        barList.add(new Bar.fromJson(m));
      }
    });
  }
  
  void _loadData() {
    barList = new List<Bar>();
    var url = 'http://lookingforbirra.esy.es/bar_db_access.php';
    _http.get(url).then((HttpResponse response){
      print(response);
      for(Map m in response.data){
        barList.add(new Bar.fromJson(m));
      }
    });
  }
}