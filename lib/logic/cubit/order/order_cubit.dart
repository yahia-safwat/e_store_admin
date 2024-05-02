// ignore_for_file: unused_import

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository _orderRepository;

  List<dynamic> products = [];
  Order order = Order.empty;

  OrderCubit({required OrderRepository orderRepository})
      : _orderRepository = orderRepository,
        super(OrderState.initial());

  void orderChanged(Order order) {
    emit(state.copyWith(
      order: order,
      status: OrderStatus.initial,
    ));
  }

  Future<void> addOrder() async {
    if (state.status == OrderStatus.submitting) return;

    emit(state.copyWith(status: OrderStatus.submitting));

    try {
      _orderRepository.addOrder(order: state.order);
      emit(state.copyWith(status: OrderStatus.success, order: state.order));
    } catch (_) {}
  }

  Future<void> deleteOrder(Order order) async {
    try {
      _orderRepository.deleteOrder(order: order);
    } catch (_) {}
  }

  // void setDefault() {}

  void setValues({required Order order}) {
    orderChanged(order);
    this.order = order;

    // products = order.products;
    // print(products);
  }
}
