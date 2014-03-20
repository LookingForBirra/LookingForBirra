import 'dart:html';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:LookingForBirra/bar.dart';


@NgController(
    selector: '[bar-list]',
    publishAs: 'ctrl')
class BarListController {
  List<Bar> barList;
  String searchTipo = "Nombre";
  String searchValor;
  Http _http;
  
  static String _databaseUrl = 'http://lookingforbirra.esy.es/bar_db_access.php';
  
  BarListController(Http this._http) {
    _loadData();
  }
  
  void search(){
    barList = new List<Bar>();
    print("XXXXXXXXXXXXXXXXXXXXXXX");
    String url = 'http://lookingforbirra.esy.es/bar_db_access.php';
    Map args = { 'tipoBusqueda' : searchTipo,
                 'valorBusqueda' : searchValor};
    _http.get(_databaseUrl, params:args).then((HttpResponse response){
      print(response);
      for(Map m in response.data){
        barList.add(new Bar.fromJson(m));
      }
    });
  }
  
  void _loadData() {
    barList = new List<Bar>();
    String url = 'http://lookingforbirra.esy.es/bar_db_access.php';
    _http.get(_databaseUrl).then((HttpResponse response){
      print(response);
      for(Map m in response.data){
        barList.add(new Bar.fromJson(m));
      }
    });
  }
}