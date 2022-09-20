import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app1/modals/cartModel.dart';
import 'package:flutter_test_app1/modals/sold_modal.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _cartpageState();
}

class _cartpageState extends State<CartPage> {
  int? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.go("/home");
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          backgroundColor: Colors.grey,
          title: Center(child: Text('Cart')),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        ),
        body: Consumer(builder: (context, ref, child) {
          final cartNumber = ref.watch(cartProvider);
          final nubiles = ref.watch(soldProvider);
          return ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: cartNumber.cart.length,
            itemBuilder: (BuildContext context, int index) {
              id = cartNumber.cart[index].id;
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.grey,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Price  ₹${cartNumber.cart[index].price.toString()}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "#  ${cartNumber.cart[index].number.toString()}",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  InkWell(
                      onTap: () {
                        showResultDialog('Item successfuly Purchased');
                        nubiles.addNumber(cartNumber.cart[index].number!,
                            cartNumber.cart[index].price!);
                      },
                      child: Column(children: [
                        Center(
                          child: Container(
                            width: 80,
                            height: 30,
                            alignment: Alignment.center,
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 124, 83),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ])),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                      onTap: () {
                        cartNumber.removeNumber(cartNumber.cart[index].id!);
                      },
                      child: Column(children: [
                        Row(
                          children: [
                            Container(
                              width: 80,
                              height: 30,
                              alignment: Alignment.center,
                              child: Text(
                                'Remove',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 0, 124, 83),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ],
                        ),
                      ]))
                ]),
              );
            },
          );
        }));
  }

  Future<void> showResultDialog(String text) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: SizedBox(
            height: 100,
            width: 100,
            child: Center(child: Text(text, textAlign: TextAlign.center)),
          ),
        ),
      );
}
