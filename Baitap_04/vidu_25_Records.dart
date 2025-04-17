/* 
Records là một kiểu dữ liệu tổng hợp (composite type) được giới thiệu trong Dart 3.0
cho phép nhóm nhiều giá trị có kiểu khác nhau thành một đơn vị duy nhất.
Records là immutable - nghĩa là không thể thay đổi sau khi được tạo.
*/

void main(){
  var r = ('first', a:2, 5, 10.5);

  //Dinh nghia record co 2 gia tri
  var point =(123,456);

  //Dinh nghia person
  var person = (name:'Alice', age: 25, 5);

  //Truy cap gia trong record
  //Dung chi so
  print(point.$1); //123
  print(point.$2); //456
  print(person.$1); //5

  //Dung ten
  print(person.name);
  print(person.age); 
}