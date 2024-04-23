import 'package:e_commerce_app/utils/color.dart';
import 'package:flutter/material.dart';
import '../CartPage/cart_page.dart';
import '../HomeScreen/home_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
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
              padding: const EdgeInsets.fromLTRB(18, 25, 18, 30),
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
                    'Total Bill',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.payment,
                    color: Colors.white,
                    size: 32,
                  )
                ],
              ),
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
              height: height * (1 / 3),
              width: width,
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Summary',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Text(
                        'Total Price (${cartList.length} items)',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.currency_rupee,
                        color: Colors.white,
                      ),
                      Text(
                        '$Amount ',
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      const Text(
                        'Discount    (10%)',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.currency_rupee,
                        color: Colors.white,
                      ),
                      Text(
                        '${Amount * (10 / 100)} ',
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 1.3,
                    width: width,
                    decoration: BoxDecoration(color: greyColor),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Text(
                        'Total Payment',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 19,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.currency_rupee,
                        color: Colors.white,
                      ),
                      Text(
                        '${Amount - (Amount * (10 / 100))} /-',
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 19,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Container(
                        width: width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white),
                        child: Text(
                          'Place Order',
                          style: TextStyle(
                              color: darkColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 23),
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
      height: 160,
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
            width: 125,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: greyColor, borderRadius: BorderRadius.circular(23)),
            child: Image.asset(productList[cartIndex]['img']),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${productList[cartIndex]['name']}',
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(height: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.currency_rupee,
                    color: Colors.white,
                  ),
                  Text(
                    '${productList[cartIndex]['prise']}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 1),
              Text(
                'Quantity : ${cartList[index]['quantity']}',
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              Row(
                children: [
                  const Text(
                    'Total   :  ',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
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
            ],
          ),
        ],
      ),
    );
  }
}
