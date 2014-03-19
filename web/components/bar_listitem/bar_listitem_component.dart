library bar_listitem_component;

import 'package:LookingForBirra/bar.dart';
import 'package:angular/angular.dart';

@NgComponent(
    selector: 'bar-listitem',
    templateUrl: 'components/bar_listitem/bar_listitem_component.html',
    cssUrl: 'components/bar_listitem/bar_listitem_component.css',
    publishAs: 'cmpBLI'
)
class BarListItemComponent{
  @NgAttr('bar')
  Bar bar;
  
  BarListItemComponent(){
  }
}