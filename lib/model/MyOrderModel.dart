import 'package:flutter/cupertino.dart';

class MyOrderModel extends ChangeNotifier{
  int oid=-1;
  int uid=1;
  String products="";
  String adress="";
  String phone="";
  MyOrderModel(this.products,this.adress,this.phone);
  void fun(){
    print("Ceva");
  }

}