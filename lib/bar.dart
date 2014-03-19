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

  Bar.fromJson(Map<String, dynamic> json) : this(json['id_BAR'],
      json['nombre'], json['direccion'], json['tipo'], json['aforo'],
      json['link'], json['tematica'], json['zona'], json['imagen']);
}