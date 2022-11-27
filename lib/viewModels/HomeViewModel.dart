import 'package:flutter/cupertino.dart';
import 'package:flutter_mycrud/Repo/OrderRepository.dart';
import 'package:flutter_mycrud/model/MyOrderModel.dart';

class HomeViewModel extends ChangeNotifier{
  HomeViewModel({required this.orderRepo,});
  List<MyOrderModel> orders = [];
  final OrderRepository orderRepo;
  Future<void> fetchData() async {
    orders = orderRepo.getRepo();
    notifyListeners();
  }
  Future<void> add(MyOrderModel orderModel) async {
    await orderRepo.addOrder(orderModel);
    notifyListeners();
  }
  Future<MyOrderModel> findById(int id) async {
    return orderRepo.findById(id);
  }
  Future<void> update(MyOrderModel order) async {
    await orderRepo.updateOrder(order);
    int index = orders.indexWhere((element) => element.oid == order.oid);
    orders[index] = order;
    notifyListeners();
  }
  Future<void> delete(int id) async {
    await orderRepo.deleteOrder(id);
    orders.removeWhere((element) => element.oid == id);
    notifyListeners();
  }
}