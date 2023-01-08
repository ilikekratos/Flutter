import 'package:flutter/cupertino.dart';
import 'package:flutter_mycrud/Repo/OrderRepository.dart';
import 'package:flutter_mycrud/model/MyOrderModel.dart';
import 'package:sqflite/sqflite.dart';

import '../db/OrderDatabase.dart';
import 'dart:developer' as developer;
class HomeViewModel extends ChangeNotifier{

  HomeViewModel({required this.orderRepo});
  List<MyOrderModel> orders = [];
  final OrderRepository orderRepo;
  Future<void> fetchData() async {
    List<MyOrderModel>? items = [];
    try {
      items = await OrderDatabase.getAll();
      if (items == null) {
        return;
      }
    } on DatabaseException catch(ex) {
      developer.log(ex.toString());
      throw Exception("Cannot fetch data");
    }
    await orderRepo.populate(items);
    orders = await orderRepo.getRepo();
    notifyListeners();
  }



  Future<void> add(MyOrderModel orderModel) async {
    try {
      int id = await OrderDatabase.add(orderModel);
      orderModel.id = id;
    } on DatabaseException catch(ex) {
      developer.log(ex.toString(), name: runtimeType.toString());
      throw Exception("Cannot add data");
    }
    await orderRepo.addOrder(orderModel);
    notifyListeners();
    print("Hey ");
  }
  Future<MyOrderModel> findById(int id) async {
    return orderRepo.findById(id);
  }
  Future<void> update(MyOrderModel order) async {
    await orderRepo.updateOrder(order);
    int index = orders.indexWhere((element) => element.id == order.id);
    orders[index] = order;
    notifyListeners();
  }
  Future<void> delete(int id) async {
    await orderRepo.deleteOrder(id);
    orders.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}