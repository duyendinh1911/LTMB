void main(){
  //Kiểu số nguyên
  int x = 100;

  //Kiểu số thực
  double y = 100.5;

  //num: có thể chứa số nguyên và số thực
  num z = 100;
  num t = 100.5;

  //Chuyển chuỗi sang số nguyên
  var one = int.parse('1');
  print(one == 1? 'True': 'False');
  
  //chuyển chuỗi sang số thực
  var onePointone = double.parse('1.1');
  print(onePointone == 1.1);

  //Sô nguyên sang chuôi
  String oneAsString = 1.toString();
  print(oneAsString);

  //Số thực sang chuỗi
  String piAsString = 3.14159.toStringAsFixed(2);
  print(piAsString);
}