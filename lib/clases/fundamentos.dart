void main() {
  // print('Hello, World!');
  // variables();
  // listaYMapa();
  // operadores();
  // control();
  // saludar("Juan", "Perez");
  // saludar2(nombre: "Tomito", apellido: "Perez");

  clima();
  obtenerClima();
}

void variables() {
  var ciudad = 'Madrid';
  var temp = 38.0;
  //late miVariable0
  const miVariable = "asasa";
  final miVariable2 = "asa";

  int edad = 90;
  double altura = 145.5;
  bool esEstudiante = true;
  String nombre = 'Juan';
  String _nombre = 'Juan'; // es privada

  // print(ciudad);
  // print(temp);
  // print(edad);
}

void printAlumnoName() {
  Alumns alumno = Alumns(nombre: 'Juan', edad: 20);
  print(alumno.nombre);
}

class Alumns {
  final String nombre;
  final int edad;

  Alumns({required this.nombre, required this.edad});
}

void listaYMapa() {
  List<String> comidas = ['Completo', 'Pasta', 'Carbonara'];
  Map<String, int> alumnos = {
    "loreto": 2,
    "Rodrigo": 3,
    "Juan": 4,
  };

  final List<Alumns> alumnos2 = [
    Alumns(nombre: 'Juan', edad: 20),
    Alumns(nombre: 'Pedro', edad: 30),
  ];

  alumnos2.map((v) => print(v)).toList(); // ejemplo de uso de flecha
}

void operadores() {
  int a = 30;
  int b = 10;

  // print(a + b);
  // print(a - b);
  // print(a * b);
  // print(a / b);
  // print(a % b);
  // print(a ~/ b);
  // print(a++);
  // print(a--);
  // print(a += b);
  // print(a -= b);
  // print(a *= b);
  // print(a /= b);
  // print(a %= b);
  // print(a ~/= b);
  // print(a == b);
  // print(a != b);
  // print(a > b);
  // print(a < b);
  // print(a >= b);
  // print(a <= b);
  // print(a && b);
  // print(a || b);
  // print(!a);

  // print(a > b);
  // print(a <= b);
  // print(a == b);
  // print(a != b);
}

void control() {
  int edad = 18;
  if (edad >= 18) {
    print('Eres mayor de edad');
  } else {
    print('Eres menor de edad');
  }

  String diaSemana = "Martes";

//switch
  switch (diaSemana) {
    case "Lunes":
      print("Hoy es Lunes");
      break;
    case "Martes":
      print("Hoy es Martes");
      break;
    default:
      print("No es ni Lunes ni Martes");
  }

//for, for in, while
  for (int i = 0; i <= 5; i++) {
    print("numero: $i");
  }

  for (var element in [1, 2, 3, 4, 5]) {
    print("elemento: $element");
  }

//while
  int count = 1;
  while (count <= 5) {
    print("count: $count");
    count++;
  }
}

void saludar(String nombre, [String apellido = '']) {
  print('Hola $nombre $apellido');
} // funcion con parametros poscionales opcionales por posicion con []

void saludar2({required String nombre, String apellido = ''}) {
  print('Hola $nombre $apellido');
} // son parametros nombrados

void saludar3({required String nombre, required String apellido}) {
  print('Hola $nombre $apellido');
} // son parametros nombrados

void saludar0(String nombre, {String apellido = ''}) {
  print('Hola $nombre $apellido');
}

class Animal {
  void sonido() => print("sonido de animal");
}

class Gato extends Animal {
  void sonido() => print("Miau");
}

Future<String> clima() async {
  await Future.delayed(const Duration(seconds: 5));
  return "El clima es soleado";
}

Future<String> obtenerClima() async{
  
  String datosClima = await clima();
  print(datosClima);
  return datosClima;
}

