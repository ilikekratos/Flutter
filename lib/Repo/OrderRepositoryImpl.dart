import 'dart:async';
import 'dart:async';

import 'package:flutter_mycrud/Repo/OrderRepository.dart';

import '../model/MyOrderModel.dart';

class OrderRepositoryImpl implements OrderRepository{
  List<MyOrderModel> orderRepo=[];
  int nextId=0;
  OrderRepositoryImpl(){
    MyOrderModel localOrder=MyOrderModel("Ex1", "Ex1", "072");
    localOrder.uid=1;
    addOrder(localOrder);
    MyOrderModel localOrder2=MyOrderModel("Ex2", "E1", "0321");
    localOrder.uid=1;
    addOrder(localOrder2);
  }


  @override
  void incrementId(){
   nextId++;
  }

  @override
  Future <MyOrderModel> addOrder (MyOrderModel orderModel)async{
   orderModel.oid=nextId;
   print("Check ids:$nextId");
   incrementId();
   orderRepo.add(orderModel);
   return orderModel;
  }




  @override
  List<MyOrderModel> getRepo(){
    return orderRepo;
  }
  @override
  Future <MyOrderModel> findById(int? id)async{
    if (id == null) {
      throw Exception("Id is null");
    }
    MyOrderModel findOrder=orderRepo.firstWhere((element) => element.oid==id);
    var returnOrder=MyOrderModel(findOrder.products, findOrder.adress, findOrder.phone);
    returnOrder.oid=id;
    returnOrder.uid=1;
    return returnOrder;
  }
  @override
  Future<void> updateOrder(MyOrderModel item) async {
    int index = orderRepo.indexWhere((element) => element.oid == item.oid);
    orderRepo[index] = item;
  }

  @override
  Future<void> deleteOrder(int? id) async {
    if (id == null) {
      return;
    }
    orderRepo.removeWhere((element) => element.oid == id);
  }
 }