import 'package:serverpod/server.dart';
import '../generated/protocol.dart';

class OrderEndpoint extends Endpoint {
  Future<List<Order>> getOrdersForDealer(Session session, int dealerId) async {
    return await Order.db.find(
      session,
      where: (t) => t.dealerId.equals(dealerId),
      orderBy: (t) => t.createdAt,
    );
  }

  Future<Order> getOrderById(Session session, int orderId) async {
    var order = await Order.db.findById(session, orderId);
    if (order == null) {
      throw Exception('Order not found');
    }
    return order;
  }

  Future<Order> createOrder(Session session, Order order) async {
    // Ensure createdAt is set
    order.createdAt = DateTime.now();
    var newOrder = await Order.db.insertRow(session, order);
    return newOrder; // Return the created order
  }

  Future<Order> updateOrderStatus(
      Session session, int orderId, String newStatus) async {
    var existingOrder = await Order.db.findById(session, orderId);
    if (existingOrder == null) {
      throw Exception('Order not found');
    }
    existingOrder.status = newStatus;
    return await Order.db.updateRow(session, existingOrder);
  }

  Future<void> deleteOrder(Session session, int orderId) async {
    var order = await Order.db.findById(session, orderId);
    if (order == null) {
      throw Exception('Order not found');
    }
    await Order.db.deleteRow(session, order); // Delete the fetched order
  }
}
