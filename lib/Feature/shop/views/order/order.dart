import 'package:e_commerce/Feature/shop/views/order/widgets/order_items_list.dart';
import 'package:e_commerce/core/utils/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text("My Order"),
      ),
      body: OrderItemsList(),
    );
  }
}
