import '../../models/models.dart';

abstract class BaseOrderRepository {
  Stream<List<Order>> getAllOrders();
  Future<void>? addOrder({Order? order});
  Future<void>? deleteOrder({Order? order});
  List<OrderStats> getAllOrderStats(List<Order> orders, String section);
  List<OrderStats> getCustomOrderStats(List<Order> orders, String section);
}
