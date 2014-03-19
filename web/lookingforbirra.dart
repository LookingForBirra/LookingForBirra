import 'dart:html';

import 'package:angular/angular.dart';
import '../lib/bar.dart';

@NgController(
    selector: '[bar]',
    publishAs: 'ctrl')
class BarController {
  Bar currentBar;

  RecipeBookController() {
    currentBar = new Bar(1, "Casa paco", "Aqui al lao", 2, 2, "", "", "", "");
  }

  void selectRecipe(int id) {
    currentBar = _loadBar(id);
  }

  Bar _loadBar(int id) {
    return null;
  }
}

class MyAppModule extends Module {
  MyAppModule() {
    type(BarController);
  }
}

void main() {
  ngBootstrap(module: new MyAppModule());
}


void reverseText(MouseEvent event) {
  var text = querySelector("#sample_text_id").text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  querySelector("#sample_text_id").text = buffer.toString();
}
