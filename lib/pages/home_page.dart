import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_test_app1/modals/cartModel.dart';
import 'package:flutter_test_app1/modals/num_model.dart';
import 'package:go_router/go_router.dart';

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final numberIndex = 0;
  int ?price;
  int ?number;
  int ?id;
  int ?index;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final numberGetter = ref.watch(numProvider);
        final cartGetter=ref.watch(cartProvider);
        return Scaffold(
          appBar: AppBar(
            title: Text('VIPNOSTORE'),
            backgroundColor: Colors.grey,
            actions: [
              IconButton(
                  onPressed: () {
                    context.go("/cart");
                  },
                  icon: Icon(Icons.shopping_cart)),
              SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {
                    context.go("/profile");
                  },
                  icon: Icon(Icons.person))
            ],
          ),
          drawer: Drawer(
            child: Column(children: [
              Image.asset(
                'assets/images/drlogo.png',
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("About us"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.call),
                title: Text("Contact us"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.filter_alt_sharp),
                title: Text("filter"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: () {
                  context.go("/");
                },
              ),
            ]),
          ),
          body: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(children: [
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10),
                      hintText: "Search",
                      suffixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  CarouselSlider(
                    items: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/lg.1.jpg'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/lg.2.jpg'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/lg.3.jpg'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 250.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                  Title(
                      color: Color.fromARGB(255, 54, 54, 54),
                      child: Text('GET YOUR',
                          style: TextStyle(
                              fontSize: 60, fontWeight: FontWeight.bold))),
                  Title(
                      color: Color.fromARGB(255, 54, 54, 54),
                      child: Text(' VIP NUMBERS',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold))),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: numberGetter.number.length,
                    itemBuilder: (BuildContext context, int index) {
                      // index=index;
                      number=numberGetter.number[index].number;
                      price=numberGetter.number[index].price;
                      id=numberGetter.number[index].id;
                      // number=numberGetter.number[index].number;


                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                        color: Color.fromARGB(255, 219, 224, 146),
                        height: 130,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              numberGetter.number[index].number.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                             "₹ ${numberGetter.number[index].price.toString()}",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            InkWell(
                              onTap: () {
                          cartGetter.addNumber(id=numberGetter.number[index].id, number=numberGetter.number[index].number, price=numberGetter.number[index].price,);

                                context.go('/cart');
                              },
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
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
                                            color:
                                                Color.fromARGB(255, 0, 124, 83),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                cartGetter.addNumber(id=numberGetter.number[index].id, number=numberGetter.number[index].number, price=numberGetter.number[index].price,);
                                context.go('/cart');
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 30,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Add To Cart',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 0, 124, 83),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ]),
              )),
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            backgroundColor: Color.fromARGB(255, 0, 53, 41),
            children: [
              SpeedDialChild(
                child: Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
                backgroundColor: Color.fromARGB(255, 187, 56, 47),
                label: 'chat',
                onTap: () {
                  context.go('/chats');
                },
              ),
              SpeedDialChild(
                child: Icon(
                  Icons.call,
                  color: Colors.white,
                ),
                backgroundColor: Color.fromARGB(255, 14, 95, 17),
                label: 'call',
                onTap: () {},
              ),
              SpeedDialChild(
                child: Icon(
                  Icons.facebook,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue,
                label: 'facebook',
                onTap: () {},
              ),
              SpeedDialChild(
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                backgroundColor: Color.fromARGB(255, 189, 49, 96),
                label: 'instagram',
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
