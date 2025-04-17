void main(){
  //Định Nghĩa:
  // - List là tập hợp các phần tử có thứ tự và có thể trùng lặp
  // - Các phần tử được truy cập bằng chỉ số (index) từ 0
  // - Kích thước có thể thay đổi được

  List<String> list1= ['A', 'B', 'C']; // Trực tiếp
  var list2 = [1,2,3];
  List<String> list3 = []; //list rỗng
  var list4 = List<int>.filled(3,0); //List có kích thước cố định
  print(list4);

  //1. Thêm phần tử
  list1.add('D');
  list1.addAll(['A','C']);
  list1.insert(0, 'Z');
  print(list1);
}