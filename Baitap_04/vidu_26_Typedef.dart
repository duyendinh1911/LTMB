/*
Typedefs trong Dart laf một cách ngắn gọn để tạo các alias (bí danh) cho các loại
dữ liệu. Điều này giúp mã hoa nguồn trở nên rõ ràng và dễ đọc hơn, đặc biệt khi làm việc
với các loại dữ liệu phức tạp.
*/


typedef IntList = List<int>;

typedef ListMapper<X> = Map<X, List<X>>;
void main(){
  IntList l1 = [1,2,3,4,5];
  print(l1);

  IntList l2 = [1,2,3,4,5,6,7];
  print(l2);

  ListMapper<String> m2 = {};
}