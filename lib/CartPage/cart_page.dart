import 'package:e_commerce_app/HomeScreen/home_page.dart';
import 'package:e_commerce_app/ProductScreen/product_page.dart';
import 'package:e_commerce_app/utils/color.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 25, 18, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 47,
                      width: 47,
                      decoration: BoxDecoration(
                        color: const Color(0xFF272D3A),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
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
                  const SizedBox(width: 30),
                  const Text(
                    'Your Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 32,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                  child: Column(
                    children: List.generate(
                        cartList.length,
                        (index) =>
                            cartProduct(cartList[index]['storeIndex'], index)),
                  ),
                ),
              ),
            ),
            Container(
              height: height * (1 / 7),
              width: width,
              padding: const EdgeInsets.only(left: 18, right: 18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF20202A),
                    darkColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Total Payment',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 20),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.currency_rupee,
                            color: Colors.white,
                          ),
                          Text(
                            // (Amount < 0)? '0.0':'${Amount - (Amount * (10 / 100))}',
                            '${Amount - (Amount * (10 / 100))}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/CheckoutScreen');
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Checkout  ',
                              style: TextStyle(
                                  color: darkColor,
                                  fontSize: 19,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: darkColor,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container cartProduct(int cartIndex, index) {
    return Container(
      height: 162,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
          color: const Color(0xFF1F222A),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: greyColor, borderRadius: BorderRadius.circular(23)),
            child: Image.asset(productList[cartIndex]['img']),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${productList[cartIndex]['name']}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 17.5),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.currency_rupee,
                    color: Colors.white,
                  ),
                  Text(
                    '${cartList[index]['prise']}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                height: 45,
                width: 130,
                decoration: BoxDecoration(
                    color: greyColor, borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            if (cartList[index]['quantity'] > 1) {
                              cartList[index]['quantity']--;
                              cartList[index]['prise'] =
                                  productList[cartList[index]['storeIndex']]['prise'] *
                                      cartList[index]['quantity'];
                              Amount = (Amount -
                                  productList[cartList[index]['storeIndex']]['prise'])
                                  .toInt();
                            }
                          });
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        )),
                    Text(
                      '${cartList[index]['quantity']}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          cartList[index]['quantity']++;
                          cartList[index]['prise'] =
                              productList[cartList[index]['storeIndex']]
                                      ['prise'] *
                                  cartList[index]['quantity'];
                          Amount = (Amount +
                                  productList[cartList[index]['storeIndex']]
                                      ['prise'])
                              .toInt();
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
          const Spacer(),
          Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    int deletItemPrise = cartList[index]['prise'];
                    cartList.removeAt(index);
                    Amount = Amount - deletItemPrise;
                  });
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 28,
                ),
              )),
        ],
      ),
    );
  }
}

List cartList = [];
int count3 = 0, totalCount = count2, Amount = 0;
