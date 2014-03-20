library user;

class User{
  int id_USER;
  String nombre;
  String apellido1;
  String apellido2;
  String ciudad;
  int puntos;
  
  User(this.id_USER, this.nombre, this.apellido1, this.apellido2, this.ciudad, this.puntos);
  
  Map<String, dynamic> toJson() => <String, dynamic>{
    'id_USER' : id_USER,
    'nombre' : nombre,
    'apellido1' : apellido1,
    'apellido2' : apellido2,
    'ciudad' : ciudad,
    'puntos' : puntos
  };
  
  User.fromJson(Map<String, dynamic> json) : this(int.parse(json['id_USER']), json['nombre'],
      json['apellido1'], json['apellido2'], json['ciudad'], int.parse(json['puntos']));
  
}