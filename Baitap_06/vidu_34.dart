class Product{
  double price;
  int quantity;
  String name;
 
  Product(this.price, {this.quantity = 0, this.name=""});
 
  void showTotal(){
    print("Totol price is: ${price*quantity}");
  }
}
 
class Tablet extends Product{
  double width = 0;
  double height = 0;
 
  Tablet(this.width, this.height, double price): super(price, quantity: 1){
    this.name = "Ipad Pro";
  }
 
  @override
  void showTotal() {
    print("Name Tablet sS:  $name");
    super.showTotal();
  }
}
  
 
// Abstract, Interface
 
 
 
/*
Mixin là một lớp có chứa các phương thức và thuộc tính dùng để gộp vào một lớp
khác. Mixin không thể được sử dụng để tạo đối tượng trực tiếp. Để sử dụng mixin, sử
dụng từ khóa with.
*/
 
mixin M {
  void showSomething() {
    print('Print message ...');
  }
}
 
class B {
  String name = 'Class B';
  void displayInformation() {
    print('Information from B');
  }
}
 
class C extends B with M {
  @override
  void displayInformation() {
    showSomething();
  }
}
 
void main() {
  var c = C();
  c.displayInformation(); // Kết quả: Print message ...
}
 
 