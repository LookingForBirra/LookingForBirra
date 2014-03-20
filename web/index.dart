import 'package:angular/angular.dart';
import 'package:LookingForBirra/controller/barcontroller.dart';
import 'package:LookingForBirra/components/bar_listitem/bar_listitem_component.dart';
import 'dart:html';

@NgDirective(
  selector: '[active-when-route]'    
)

class CurrentRoute{
  Router router;
  Element element;
  
  CurrentRoute(this.element, this.router) {
      toggleActive();

      router.onRouteStart.listen((e) {
        e.completed.then((_) {
            toggleActive();
          });
      });
    }
  
  bool isRoute() {
     // TODO how to tell if we're in the default route?
     if (router.activePath.isEmpty) return false; // this happens on initial load
     return element.attributes['active-when-route'] == router.activePath.first.name;
   }
  
  void toggleActive() {
      if (isRoute()) {
        element.classes.add('active');
      } else {
        element.classes.remove('active');
      }
    }  
}

class AppRouteInitializer implements RouteInitializer{
  init (Router router, ViewFactory view){
    router.root
      ..addRoute(
        name: 'inicio',
        path: '/inicio',

          defaultRoute: true,
        enter: view('inicio.html'))
      ..addRoute(
        name: 'bares',
        path: '/bares',
        enter: view('bares.html'))
      ..addRoute(
        name:'noticias',
        path: '/noticias',
        enter: view('noticias.html'));
    
    }
}

main() {
  ngBootstrap(module: new AngularModule()
    ..type(CurrentRoute)
    ..type(BarListController)
    ..type(BarListItemComponent)
    ..type(RouteInitializer, implementedBy: AppRouteInitializer)
    ..factory(NgRoutingUsePushState, (_) => new NgRoutingUsePushState.value(false))
  );
}