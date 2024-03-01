import 'package:flutter/material.dart';
import '../../../../core/utils/common/widgets/appbar/appbar.dart';
import '../home/widgets/cart_counter.dart';
import 'widgets/brand_section.dart';
import 'widgets/catgory_tab.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppBar(
          showBackArrow: false,
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          actions: [
            CartCounterIcon(
              onPressed: () {},
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxScrollabe) => [
            const BrandSection(),
          ],
          body: const TabBarView(
            children: [
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
