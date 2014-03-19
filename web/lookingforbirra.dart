import 'package:angular/angular.dart';
import '../lib/controller/barcontroller.dart';

class MyAppModule extends Module {
  MyAppModule() {
    type(BarController);
    type(BarListController);
  }
}

main() {
  ngBootstrap(module: new MyAppModule());
}
