library bar;

class Bar{
  int id;
  String name;
  String address;
  int tipo;
  int aforo;
  String link;
  String tematica;
  String zona;
  String imgURL;
  //List<Cerveza> myBeers;
  
  Bar(this.id, this.name, this.address, this.tipo ,this.aforo ,this.link, this.tematica,
      this.zona ,this.imgURL);
  
  String get tipoAsString{
    switch(this.tipo){
          case 1:
            return "Bar";
            break;
          case 2:
            return "Pub";
            break;
          case 3:
            return "Taberna";
            break;
          case 4:
            return "Terraza";
            break;
          default: return "";
        }
  }
  
  Map<String, dynamic> toJson() => <String, dynamic>{
      "id_BAR": id,
      "nombre": name,
      "direccion": address,
      "tipo": tipo,
      "aforo": aforo,
      "link": link,
      "tematica" : tematica,
      "zona" : zona,
      "imagen": imgURL
  };

  Bar.fromJson(Map<String, dynamic> json) : this(int.parse(json['id_BAR']),
      json['Nombre'], json['Direccion'], int.parse(json['Tipo']), int.parse(json['Aforo']),
      json['Link'], json['Tematica'], json['Zona'], json['Imagen']);
}