import '../../../../data/models/order_model.dart';

final List<String> sections = [
  'Pending',
  'Accepted',
  'Shipped',
  'Delivered',
  'Cancelled',
];

final List<String> categories = [
  'Pending',
  'Accepted',
  'Shipped',
  'Delivered',
  'Cancelled',
];

final List<String> icons = [
  'assets/icons/Flash Icon.svg',
  'assets/icons/Bill Icon.svg',
  'assets/icons/Gift Icon.svg',
  'assets/icons/Check mark rounde.svg',
  'assets/icons/Close.svg',
];

List<Order> getOrders(List<Order> orders, String title) {
  switch (title) {
    case 'Pending':
      return orders
          .where((order) => order.isPending! && order.isAccepted == false)
          .toList();

    case 'Accepted':
      return orders
          .where((order) =>
              order.isPending! && order.isAccepted! && order.isShipped == false)
          .toList();

    case 'Shipped':
      return orders
          .where((order) =>
              order.isPending! &&
              order.isAccepted! &&
              order.isShipped! &&
              order.isDelivered == false)
          .toList();

    case 'Delivered':
      return orders
          .where((order) =>
              order.isPending! &&
              order.isAccepted! &&
              order.isShipped! &&
              order.isDelivered!)
          .toList();

    case 'Cancelled':
      return orders.where((order) => order.isCancelled == true).toList();

    default:
      return orders;
  }
}

int getNumOfitem({required String text, required List<Order> orders}) {
  switch (text) {
    case 'Pending':
      return orders
          .where((order) => order.isPending! && order.isAccepted == false)
          .toList()
          .length;

    case 'Accepted':
      return orders
          .where((order) =>
              order.isPending! && order.isAccepted! && order.isShipped == false)
          .toList()
          .length;

    case 'Shipped':
      return orders
          .where((order) =>
              order.isPending! &&
              order.isAccepted! &&
              order.isShipped! &&
              order.isDelivered == false)
          .toList()
          .length;

    case 'Delivered':
      return orders
          .where((order) =>
              order.isPending! &&
              order.isAccepted! &&
              order.isShipped! &&
              order.isDelivered!)
          .toList()
          .length;

    case 'Cancelled':
      return orders.where((order) => order.isCancelled == true).toList().length;

    default:
      return 0;
  }
}

getUniqueTag(String section, Order order) {
  switch (section) {
    case 'Pending':
      return '$section&${order.orderId}';

    case 'Accepted':
      return '$section&${order.orderId}';

    case 'Shipped':
      return '$section&${order.orderId}';

    case 'Delivered':
      return '$section&${order.orderId}';

    case 'Cancelled':
      return '$section&${order.orderId}';

    default:
      return 'default&${order.orderId}';
  }
}

String getSectionIcon(String section) {
  switch (section) {
    case 'Pending':
      return 'assets/icons/Flash Icon.svg';

    case 'Accepted':
      return 'assets/icons/Bill Icon.svg';

    case 'Shipped':
      return 'assets/icons/Bill Icon.svg';

    case 'Delivered':
      return 'assets/icons/Gift Icon.svg';

    case 'Cancelled':
      return 'assets/icons/Close.svg';

    default:
      return 'assets/icons/Flash Icon.svg';
  }
}
