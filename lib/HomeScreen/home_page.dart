import 'package:e_commerce_app/CartPage/cart_page.dart';
import 'package:e_commerce_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';

import '../ProductScreen/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkColor,
        body: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/image/me.jpeg'),
                            )),
                      ),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '  Welcom User 👋\n',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                            TextSpan(
                              text: '  Ankit Umredkar',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconOfLink(
                          link: '/CartScreen',
                          icon: Icons.shopping_cart_outlined,
                          number: cartList.length),
                      const SizedBox(width: 5),
                      IconOfLink(
                          link: '/BookMarkPage',
                          icon: Icons.favorite_outline_rounded,
                          number: likedProductList.length),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: const Color(0xff292f38),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        suffixIcon: Icon(Icons.tune, color: Colors.grey),
                        border: InputBorder.none,
                        hintText: 'Search Item...',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                RowTextOnly('Special Offers'),
                const SizedBox(height: 24),
                Marquee(
                  animationDuration: const Duration(milliseconds: 5000),
                  child: Row(
                    children: [
                      Offers(width, 30, "Today's Special",
                          'assets/image/product/bannerimg.png'),
                      const SizedBox(width: 18),
                      Offers(width, 25, "Weekend Deals",
                          'assets/image/product/bannerimg2.png'),
                      const SizedBox(width: 18),
                      Offers(width, 40, "New Arrivals",
                          'assets/image/product/bannerimg3.png'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      4, (index) => Categories(categoriesList[index])),
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      4, (index) => categoryText(textList[index + 1])),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      4, (index) => Categories(categoriesList[index + 4])),
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      4, (index) => categoryText(textList[index + 5])),
                ),
                const SizedBox(height: 24),
                RowTextOnly('Most Popular'),
                const SizedBox(height: 24),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(
                      8,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            tapColor[index] = !(tapColor[index]);
                          });
                        },
                        child: (index == 3)
                            ? popularContainer(
                                textList[index], 135, tapColor[index])
                            : popularContainer(
                                textList[index], 115, tapColor[index]),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Wrap(
                  children: List.generate(
                      productList.length,
                      (index) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/ProductScreen',
                                  arguments: index);
                              count = 1; storeIndex = index; count2 = count;
                              prise2 = productList[storeIndex]['prise'] * count;
                            },
                            child: productRow(
                              productList[index]['img'],
                              productList[index]['name'],
                              productList[index]['prise'],
                              productList[index]['sold'],
                              productList[index]['rate'],
                              index,
                              width,
                            ),
                          )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container Offers(double width, int discount, String letter, String img) {
    return Container(
      height: 200,
      width: width - 41.0,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.fromLTRB(28, 22, 0, 0),
      decoration: BoxDecoration(
        color: const Color(0xFF35383F),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  '$discount%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                letter,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                "Get discount for every\norder. only valid for \ntoday",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Image.asset(img),
        ],
      ),
    );
  }

  Stack IconOfLink(
      {required String link, required IconData icon, required int number}) {
    return Stack(
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(link);
            },
            child: Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            height: 20,
            width: 20,
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Text(
              '$number',
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container productRow(var img, String data, int prise, int sold, double rate,
      int index, double width) {
    return Container(
      height: 340,
      width: width / (2.37),
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(bottom: 29, right: 12),
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
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          likeList[index] = !likeList[index];
                          (likeList[index])
                              ? likedProductList.add(index)
                              : likedProductList.remove(index);
                        });
                      },
                      child: Icon(
                        (likeList[index])
                            ? likeIcon = Icons.favorite_rounded
                            : likeIcon = Icons.favorite_outline_rounded,
                        color: (likeList[index])
                            ? likeIconColor = Colors.red
                            : likeIconColor = Colors.white,
                      ),
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
                fontSize: 17.5),
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}

List likeList = List.generate(productList.length, (index) => false);
List tapColor = List.generate(8, (index) => false);
List likedProductList = [];
int storeIndex = 0;
bool check = false;
var likeIcon = Icons.favorite_outline_rounded, likeIconColor = Colors.white;
List productList = [
  {
    'img': 'assets/image/product/jblheadphone.png',
    'name': 'JBL Headphone',
    'prise': 5000,
    'sold': 8934,
    'rate': 5.2,
  },
  {
    'img': 'assets/image/product/boatheadphone.png',
    'name': 'Boat Headphone',
    'prise': 3000,
    'sold': 6771,
    'rate': 6.0,
  },
  {
    'img': 'assets/image/product/boat.png',
    'name': 'Boat Eardopes',
    'prise': 3500,
    'sold': 6924,
    'rate': 5.9,
  },
  {
    'img': 'assets/image/product/bluetooth.png',
    'name': 'Boat Bluetooth',
    'prise': 2500,
    'sold': 8644,
    'rate': 5.3,
  },
  {
    'img': 'assets/image/product/sonyheadphone.png',
    'name': 'Sony Headphone',
    'prise': 5000,
    'sold': 10032,
    'rate': 6.2,
  },
  {
    'img': 'assets/image/product/speaker.png',
    'name': 'JBL Speaker',
    'prise': 6000,
    'sold': 9432,
    'rate': 5.7,
  },
  {
    'img': 'assets/image/product/camera2.png',
    'name': 'Canon Camera',
    'prise': 4500,
    'sold': 9054,
    'rate': 5.2,
  },
  {
    'img': 'assets/image/product/sonycamera.png',
    'name': 'Sony Camera',
    'prise': 4000,
    'sold': 8334,
    'rate': 7.2,
  },
  {
    'img': 'assets/image/product/panasonic camera.png',
    'name': 'Lumix Camera',
    'prise': 3500,
    'sold': 7992,
    'rate': 5.5,
  },
  {
    'img': 'assets/image/product/camera.png',
    'name': 'Fuji film Camera',
    'prise': 3500,
    'sold': 8534,
    'rate': 4.9,
  },
  {
    'img': 'assets/image/product/watch.png',
    'name': 'Smart Watch',
    'prise': 4000,
    'sold': 8934,
    'rate': 5.8,
  },
  {
    'img': 'assets/image/product/microphone.png',
    'name': 'Rod Microphone',
    'prise': 3500,
    'sold': 7644,
    'rate': 5.7,
  },
  {
    'img': 'assets/image/product/laptop.png',
    'name': 'MSI Laptop',
    'prise': 50000,
    'sold': 18347,
    'rate': 8.7,
  },
  {
    'img': 'assets/image/product/hplaptop.png',
    'name': 'HP Laptop',
    'prise': 60000,
    'sold': 18347,
    'rate': 8.6,
  },
];

Container popularContainer(String data, double Width, bool tf) {
  return Container(
    height: 45,
    width: Width,
    alignment: Alignment.center,
    margin: const EdgeInsets.only(right: 15),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: (tf) ? greyColor : darkColor,
        border: Border.all(
          color: greyColor,
          width: 3,
        )),
    child: Text(
      data,
      style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins'),
    ),
  );
}

Row RowTextOnly(String data) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        data,
        style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
      const Spacer(),
      const Text(
        'See All',
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    ],
  );
}

Text categoryText(String data) {
  return Text(
    data,
    style: const TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1,
    ),
  );
}

Container Categories(var img) {
  return Container(
    height: 60,
    width: 60,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: greyColor,
      image: DecorationImage(
        image: AssetImage(img),
      ),
    ),
  );
}

List<String> categoriesList = [
  'assets/image/category/clothes.png',
  'assets/image/category/shoes.png',
  'assets/image/category/device.png',
  'assets/image/category/bag.png',
  'assets/image/category/watch.png',
  'assets/image/category/jewelry.png',
  'assets/image/category/kitchen.png',
  'assets/image/category/toy.png',
];

List<String> textList = [
  'All',
  ' Clothes',
  'Shoes',
  'Electronics',
  'Bags  ',
  ' Watch',
  'Jewelry',
  'Kitchen',
  'Toys  '
];
