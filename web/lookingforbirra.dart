import 'package:angular/angular.dart';
import 'package:LookingForBirra/controller/barcontroller.dart';
import 'package:LookingForBirra/components/bar_listitem/bar_listitem_component.dart';

class MyAppModule extends Module {
  MyAppModule() {
    type(BarListController);
    type(BarListItemComponent);
  }
}

main() {
  ngBootstrap(module: new MyAppModule());
}
