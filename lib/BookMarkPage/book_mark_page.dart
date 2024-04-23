import 'package:e_commerce_app/utils/color.dart';
import 'package:flutter/material.dart';
import '../HomeScreen/home_page.dart';
import '../ProductScreen/product_page.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(21, 25, 21, 0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Row(
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
                      'Saved Products',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                Wrap(
                  children: List.generate(
                    likedProductList.length,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/ProductScreen');
                        setState(() {
                          count = 1;
                          storeIndex = likedProductList[index];
                        });
                      },
                      child: productRow(
                        productList[likedProductList[index]]['img'],
                        productList[likedProductList[index]]['name'],
                        productList[likedProductList[index]]['prise'],
                        productList[likedProductList[index]]['sold'],
                        productList[likedProductList[index]]['rate'],
                        likedProductList[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container productRow(
      var img, String data, int prise, int sold, double rate, int index) {
    return Container(
      height: 360,
      width: 172.5,
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xFF3D4148),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: darkColor,
                    ),
                    child: const Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,
                    ),
                  ),
                ),
                Image.asset(img),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Text(
            data,
            style: const TextStyle(
                letterSpacing: 0.5,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 17),
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              const Icon(
                Icons.star_half,
                color: Colors.yellow,
              ),
              Text(
                ' $rate  |  ',
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'Poppins', fontSize: 15),
              ),
              Container(
                height: 30,
                width: 78,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: greyColor,
                ),
                child: Text(
                  '$sold sold',
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              const Icon(Icons.currency_rupee, color: Colors.white),
              Text(
                '$prise/-',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
