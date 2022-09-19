import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app1/modals/cartModel.dart';
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
        ),
        body: Consumer(builder: (context, ref, child) {
          final cartNumber = ref.watch(cartProvider);
          return ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: cartNumber.cart.length,
            itemBuilder: (BuildContext context, int index) {
              id=cartNumber.cart[index].id;
              return Container(
                  margin: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                  color: Color.fromARGB(255, 219, 224, 146),
                  height: 130,
                  width: double.infinity,
                  child: Column(children: [
                    Text(
                      cartNumber.cart[index].number.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      cartNumber.cart[index].price.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    InkWell(
                        onTap: () {
                          context.go('/cart');
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
                  ]));
            },
          );
        }));
  }
}
