library bar_listitem_component;

import 'package:angular/angular.dart';

@NgComponent(
    selector: 'barlistitem',
    templateUrl: '../lib/components/bar_listitem/bar_listitem_component.html',
    cssUrl: '../lib/components/bar_listitem/bar_listitem_component.css',
    publishAs: 'cmpBLI',
    applyAuthorStyles: true
)
class BarListItemComponent{
  @NgAttr('barname')
  String barName;
  
  @NgAttr('baraddress')
  String barAddress;
  
  @NgAttr('bartipo')
  String barTipo;
  
  @NgAttr('bartematica')
  String barTematica;
  
  BarListItemComponent();
}