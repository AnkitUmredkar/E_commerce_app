import 'package:e_commerce_app/utils/color.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(18, 25, 18, 0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: (Column(
              children: [
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
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 38,
                    )
                  ],
                ),
                Container(
                  height: 130,
                  width: 130,
                  margin: const EdgeInsets.only(top: 40, bottom: 15),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image/me.jpeg'),
                      )),
                ),
                const Text(
                  'Ankit Umredkar',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                const Text(
                  '+91 9328871654',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                  ),
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 25, bottom: 22),
                  decoration: BoxDecoration(color: greyColor),
                ),
                ...List.generate(icons.length,
                    (index) => setting(icons[index], text[index], index))
              ],
            )),
          ),
        ),
      ),
    );
  }

  Container setting(dynamic icon, String data, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Icon(
            icon,
            color: (index == icons.length - 1) ? Colors.red : Colors.white,
            size: 35,
          ),
          const SizedBox(width: 16),
          Text(
            data,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              color: (index == icons.length - 1) ? Colors.red : Colors.white,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 22,
          ),
        ],
      ),
    );
  }
}

List<dynamic> icons = [
  Icons.person_2_outlined,
  Icons.location_on_outlined,
  Icons.notifications_none_outlined,
  Icons.payment,
  Icons.verified_user_outlined,
  Icons.language,
  Icons.lock_outline,
  Icons.help_center_outlined,
  Icons.supervised_user_circle_outlined,
  Icons.logout,
];

List text = [
  'Edit Profile',
  'Address',
  'Notification',
  'Payment',
  'Security',
  'Language',
  'Privacy Policy',
  'Help Center',
  'Invite Friends',
  'Log Out',
];
