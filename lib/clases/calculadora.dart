import 'dart:io';

void main() {
  stdout.write("Ingresa una de las siguientes opciones: ");

  List<String> opciones = [
    "1.Suma",
    "2.Resta",
    "3.Multiplicación",
    "4.División"
  ];
  for (int i = 0; i < opciones.length; i++) {
    stdout.writeln(opciones[i]);
  }

  int opcion = int.parse(stdin.readLineSync()!);

  stdout.write("Ingresa el primer numero: ");
  int a = int.parse(stdin.readLineSync()!);

  stdout.write("Ingresa el Segundo numero: ");
  int b = int.parse(stdin.readLineSync()!);

  switch (opcion) {
    case 1:
      print(a + b);
      break;
    case 2:
      print(a - b);
      break;
    case 3:
      print(a * b);
      break;
    case 4:
      print(a / b);
      break;
    default:
      print("Opción no válida");
  }
}
