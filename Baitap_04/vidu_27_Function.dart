/*
Dart la mot ngon ngu thuan huong doi tuong, vi vay ngay ca cac ham cung laf doi tuong va co kie Function 
 Dieu nay co nghia la cac ham co the duoc gan cho cac bien hoac truyen lam tham so cho cac
 Ta cunxg cos the goi mot te hien (instance) cua moy lop Dart nhu the no la mot ham
 */

/*
Hàm là một khối lệnh thực hiện một tác vụ gì đó, khối lệnh này được dùng nhiều
lần nên gom chúng tại thành một hàm. 
*/

double tinhtong(var a, double b, double c){
  return a + b + c;
}

//Su dung cu phap rut gon "=>"
double tinhtong1(var a, double b, double c) => a + b + c;

/*
luu y: chỉ có biểu thức (expression) đứng đằng sau =>, không áp dụng cho câu lênh (statement).
Ví dụ: Ta không thể để is sratement đằng sau => được. Tuy nhiên ta có thể sử dụng toán tử 3 ngôi:
condition ? expr1 : expr2
*/

  

// hàm với tên của tham số
//Khi gọi 1 hàm (function), ta có thể truyền giá trị thông qua tên biến paramName: va;ue,

String creareFullName({String ho="Hoang", String chuLot="Bich", String ten ="Ha"}){
  return ho+" "+chuLot+" "+ten;
}


//Tham so tuy chon (co hay khong cung duoc)
//Tham so tuy chon (co hay khong cung duoc)
/*
Các tham số tuỳ chịn trong hàm cho phép ta gọi hàm mà không cần cung cấp đầy đỉ tất cả các tham số. Ki các tham số tuỳ chọn ko được cung cấp, chúng sẽ nhận 
giá trị null theo mặc định.
Để khai báo các thazm số tuỳ chọn, ta sử dụng dấu ngoặc vuông[]
*/

double sum(double a, [double? b, double? c, double? d]){
var result = a;
result += (b!= null)?b:0;
result += (c!= null)?c:0;
result += (d!= null)?d:0;
return result;
}


//Hàm ẩn danh
/*
Trong dart, ta có thể tạo các hàm không có tên gọi là hàm ẩn danhm hay còn gọi là
lamda hoặc closure

Chúng thường được sử dụng trong các ngữ cảnh mà ta không cần sử dụng tên hàm, ví dụ như khi truyền hàm như tham số cho hàm khác.

Để tạo hàm ẩn danh, ta có thể sử dụng cú pháp tương tự như khi khai báo hàm có tên, nhưng bỏ qua phần kiểu trả về và tên hàm
*/




// Ham main(): khoi dau ung dung
void main(){
  print ("Hello world!");
  var x = tinhtong(1,10,100);
  print(x);

   var y = tinhtong(1,10,100);
  print(y);

  var fn = creareFullName(ho: "Dinh", chuLot: "Thi", ten: "Duyen");
  print(fn);

  var fn2 = creareFullName(chuLot: "Thi", ten: "Duyen");
  print(fn2);


  print(sum(10));
  print(sum(10,1));
  print(sum(10 ));
  print(sum(10,1,2,3));
} 

