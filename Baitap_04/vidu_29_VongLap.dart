void main(){
    //Vong lap for
    for(var i = 1; i<=5; i++){
      print(i);
    }

    //Imterable: List, Set
    //for-in
    var names = ["Dinh", "Thi", "Duyen"];
    for (var name in names){
      print(name);
    }

    //vong lap while
    var i = 1;
    while(i<=5){
      print(i);
      i++;
    }
    //vong lap do-while (thuc hien it nhat 1 lan)
    var x = 1;
    do{
      print(x);
      x++;
    }while(x<=5);
  print("----");

    //break / conntinue
     x = 1;
    do{
      print(x);
      x++;
      if(x==3) break;
    }while(x<=5);
    print("----");
    
    // conntinue: dung de bo qua phan con lai cua vong lap hien tai va tiep tuc vong lap tiep theo
     x = 0;
    do{
      x++;
      if(x==3) continue;
      print(x);
    }while(x<=5);

}