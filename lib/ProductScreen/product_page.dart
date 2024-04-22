import 'dart:async';
import 'package:e_commerce_app/CartPage/cart_page.dart';
import 'package:e_commerce_app/HomeScreen/home_page.dart';
import 'package:e_commerce_app/utils/color.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: greyColor,
        body: Column(
          children: [
            Container(
              height: height * (1 / 2.6),
              width: width,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.fromLTRB(20, 22, 22, 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF272D3A),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black87,
                            offset: Offset(6, 6),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: const Icon(Icons.arrow_back,
                          color: Colors.white, size: 30),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 35, top: 20),
                      margin: const EdgeInsets.only(left: 10),
                      height: double.infinity,
                      child: Image.asset(productList[storeIndex]['img']),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: width,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                  color: darkColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productList[storeIndex]['name'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Icon(
                          (likeList[storeIndex])
                              ? likeIcon = Icons.favorite_rounded
                              : likeIcon = Icons.favorite_outline_rounded,
                          color: (likeList[storeIndex])
                              ? likeIconColor = Colors.red
                              : likeIconColor = Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 78,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: greyColor,
                          ),
                          child: Text(
                            '${productList[storeIndex]['sold']} sold',
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 10.5,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(width: 13),
                        const Icon(
                          Icons.star_half,
                          color: Colors.yellow,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${productList[storeIndex]['rate']} (${review[storeIndex]} reviews)',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    horizontalLine(),
                    const Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      "Convenient, vast selection, secure transactions, saticfication, user experience for shoppers",
                      style:
                          TextStyle(fontFamily: 'Poppins', color: Colors.white),
                    ),
                    const SizedBox(height: 14),
                    const Text('Color',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            color: Colors.white)),
                    const SizedBox(height: 14),
                    Row(
                        children: List.generate(colorlist.length,
                            (index) => colors(colorlist[index], index))),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text(
                          'Qauntity',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        Container(
                          height: 50,
                          width: 150,
                          margin: const EdgeInsets.only(left: 14),
                          decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      (count > 0) ? count-- : count = 0;
                                      count2 = count;
                                      prise2 = (count2 > 0) ? (productList[storeIndex]['prise'] * count2) : 0;
                                      if (count == 0) {
                                        prise2 = 0;
                                        count2 = 0;
                                      }
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  )),
                              Text(
                                '$count',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    count++;
                                    count2 = count;
                                    prise2 = productList[storeIndex]['prise'] *
                                        count;
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    horizontalLine(),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total Amount',
                              style: TextStyle(
                                  fontFamily: 'Poppins', color: Colors.white),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.currency_rupee_rounded,
                                  color: Colors.white,
                                ),
                                Text(
                                  '${productList[storeIndex]['prise'] * count}',
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              bool isContains = false;
                              tick = false;
                              for (int i = 0; i < cartList.length; i++) {
                                if (cartList[i]['storeIndex'] == storeIndex) {
                                  isContains = true;
                                }
                              }
                              if (!isContains) {
                                if(count == 0){
                                  var snackBar = SnackBar(
                                    backgroundColor: Colors.grey.shade900,
                                    elevation: 0,
                                    content: const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                      child: Row(
                                        children: [
                                          Icon(Icons.shopping_cart,
                                              color: Colors.white),
                                          SizedBox(width: 8),
                                          Text(
                                            'Must be Atleast one Quantity',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                                else{
                                  tick = true;
                                  cartList.add({
                                    'storeIndex': storeIndex,
                                    'quantity': count2,
                                    'prise': prise2,
                                  });
                                  Amount += prise2;
                                }
                              } else {
                                var snackBar = SnackBar(
                                  backgroundColor: Colors.grey.shade900,
                                  elevation: 0,
                                  content: const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Row(
                                      children: [
                                        Icon(Icons.shopping_cart,
                                            color: Colors.white),
                                        SizedBox(width: 8),
                                        Text(
                                          'Product is Already Added',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  action: SnackBarAction(
                                    label: 'go to cart',
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('/CartScreen');
                                    },
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            });
                            Timer(const Duration(seconds: 1), () {
                              setState(() {
                                tick = false;
                              });
                            });
                          },
                          child: Container(
                            height: 60,
                            width: 210,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black87,
                                  offset: Offset(6, 6),
                                  blurRadius: 15,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: (tick)
                                ? Icon(
                                    Icons.check,
                                    size: 30,
                                    color: darkColor,
                                  )
                                : const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.shopping_bag,
                                        size: 25,
                                      ),
                                      Text(
                                        '   Add to Cart',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container horizontalLine() {
    return Container(
      height: 2,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14, top: 14),
      decoration: BoxDecoration(
        color: greyColor,
      ),
    );
  }
}

bool Check = false, tick = false;
List colorlist = [
  Colors.black,
  Colors.blue,
  Colors.purple,
  Colors.brown,
  Colors.teal,
  Colors.red,
];

Container colors(Color color, int index) {
  return Container(
    height: 35,
    width: 35,
    margin: const EdgeInsets.only(right: 10),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color,
    ),
  );
}

List review = [
  '5,369',
  '8,546',
  '7,635',
  '4,321',
  '5,641',
  '9,795',
  '3,214',
  '9,546',
  '7,542',
  '8,523',
  '7,761',
  '9,643',
  '6,846',
  '7,593',
];

int count2 = 0,count = 0, prise2 = 0;
int cartIndex = 0;
