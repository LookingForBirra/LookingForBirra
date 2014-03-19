import 'package:angular/angular.dart';
import '../bar.dart';

@NgController(
    selector: '[bar]',
    publishAs: 'ctrl')
class BarController {
  Bar currentBar = new Bar(1, "Casa paco", "Aqui al lao", 2, 2, "", "", "", "");
  Http _http;
  
  BarController() {
  }
  
  String get barName => currentBar.name;

  void selectBar(int id) {
    currentBar = _loadBar(id);
  }

  Bar _loadBar(int id) {
    return null;
  }
}

@NgController(
    selector: '[bar-list]',
    publishAs: 'ctrl')
class BarListController {
  List<Bar> barList;
  Http _http;
  
  BarListController() {
    _loadData();
  }
  
  void _loadData() {
    barList = new List<Bar>();
    var url = 'lookingforbirra.esy.es/bar_db_acces.php';
    _http.get(url).then((HttpResponse response){
      print(response);
      for(Map m in response.data){
        barList.add(new Bar.fromJson(m));
      }
    });
  }
}