void main(){
  Object obj = "hello";

  //Kiem tra obj co phai la String
  if(obj is String){
  print('obj la mot String');
}
if(obj is! int){
  print("obj khong phai la so nguyen int");
}

//ep kieu
String str = obj as String;
print(str.toUpperCase());
}