import 'dart:io';

void main(){
  stdout.write ('Enter your name: ');
  String name = stdin.readLineSync()!;

  stdout.write('Enter your age');
  int age = int.parse(stdin.readLineSync()!);
  print("Xin chao: $name, Tuoi cua ban la: $age");
}