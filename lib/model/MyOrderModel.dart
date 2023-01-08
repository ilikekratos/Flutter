import 'package:flutter/cupertino.dart';
const  String OrderTable= 'orders';
class OrderFields {
  static final String id="id";
  static final String uid="_uid";
  static final String products="products";
  static final String adress="adress";
  static final String phone="phone";
}
class MyOrderModel extends ChangeNotifier{
   int? id;
   int? uid;
   String products;
   String adress;
   String phone;
  MyOrderModel.empty({
    this.id,
    this.uid,
    required this.products,
    required this.adress,
    required this.phone
  });
   MyOrderModel.all({
     required this.id,
     required this.uid,
     required this.products,
     required this.adress,
     required this.phone
   });

  void fun(){
    print("Ceva");
  }

  Map<String,Object?>toJson()=>{
    OrderFields.uid:uid,
    OrderFields.products:products,
    OrderFields.adress:adress,
    OrderFields.phone:phone
};
  MyOrderModel copy({
    int? id,
    int?   uid,
    String? products,
    String? phone,
    String? adress

  })=>MyOrderModel.empty(
    id: id ?? this.id,
    uid: uid ?? this.uid,
    products: products ?? this.products,
    adress: adress ?? this.adress,
    phone: phone ?? this.phone,
  );
   factory MyOrderModel.fromJson(Map<String, dynamic> json) {
     var order = MyOrderModel.all(
       id: json['id'],
       uid: json['uid'],
       products: json['products'],
       adress: json['adress'],
       phone: json['phone'],
     );
     return order;
   }
}