import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderStats {
  final DateTime dateTime;
  final int index;
  final int orders;
  charts.Color? barColor;

  OrderStats({
    required this.dateTime,
    required this.index,
    required this.orders,
    this.barColor,
  }) {
    barColor = charts.ColorUtil.fromDartColor(Colors.black);
  }

  factory OrderStats.fromSnapshot(DocumentSnapshot snap, int index) {
    return OrderStats(
      index: index,
      dateTime: snap['dateTime'].toDate(),
      orders: snap['orders'],
    );
  }
}
