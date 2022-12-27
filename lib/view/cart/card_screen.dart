import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_grocery/component/input_text_button.dart';
import 'package:my_grocery/controller/controllers.dart';
import 'package:my_grocery/model/cart_item.dart';
import 'package:shimmer/shimmer.dart';

import '../../const.dart';
import 'cart_card.dart';
import 'cart_loading_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Cart"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 1,
      ),
      body: Obx(() {
        if (cartController.isCartLoading.value) {
          return RefreshIndicator(
            color: Theme.of(context).primaryColor,
            onRefresh: () async {
              return Future.delayed(const Duration(seconds: 1));
            },
            child: ListView.builder(
              itemCount: cartController.cartItemList.length,
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Dismissible(
                  key: Key(UniqueKey().toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      // cartController.removeCart(index: index, itemId: cartController.cartItemList[index].);
                    });
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        Icon(
                          Icons.delete_outline,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                  child: const CartLoadingCard(),
                ),
              ),
            ),
          );
        } else {
          return RefreshIndicator(
            color: Theme.of(context).primaryColor,
            onRefresh: () async {
              return Future.delayed(const Duration(seconds: 1));
            },
            child: ListView.builder(
              itemCount: cartController.cartItemList.length,
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Dismissible(
                  key: Key(UniqueKey().toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      // cartController.removeCart(index);
                    });
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        Icon(
                          Icons.delete_outline,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                  child: CartCard(
                    cartItem: cartController.cartItemList[index],
                  ),
                ),
              ),
            ),
          );
        }
      }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 70,
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black87, width: 0.5))),
        child: Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (cartController.isCartLoading.value)
                  ? Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: Colors.grey.shade300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 20,
                            width: 100,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Container(
                            height: 16,
                            width: 40,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total: \$ ${cartController.getCartTotal().toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Items: ${cartController.cartItemList.length}",
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
              const Spacer(),
              SizedBox(
                  height: 50,
                  width: 140,
                  child: InputTextButton(title: "Checkout", onClick: () {}))
            ],
          ),
        ),
      ),
    );
  }
}
