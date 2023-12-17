// ignore_for_file: use_full_hex_values_for_flutter_colors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:food/app/data/model_makanan.dart';
import 'package:food/app/screen/detail_makanan.dart';
import 'package:food/app/screen/profile.dart';
import 'package:food/app/view%20model/fetch_makanan.dart';
import 'package:get/get.dart';
// import 'package:food/app/screen/detail_makanan.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:food/app/data/makanan.dart';

var category = ["All", "Breakfas", "Lunch", "Dinner"];
var selectedCategory = 0;

class HomeScreen extends StatefulWidget {
  // const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Makanan> detailMakanan = [];
  Repository repo = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.greenAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
              break;
            case 1:
              // Navigasi ke halaman ProfilePage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              );
              break;
          }
        },
        currentIndex: 0,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfffF0F6F4),
      body: SingleChildScrollView(
        child: SafeArea(
            // width: double.infinity,
            // height: double.infinity,
            child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            greetings(),
            const SizedBox(
              height: 24,
            ),
            searchBar(),
            const SizedBox(
              height: 24,
            ),
            banner(),
            const SizedBox(
              height: 20,
            ),
            categories(),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Quick & Easy',
                          style: GoogleFonts.manrope(
                              fontSize: 24, fontWeight: FontWeight.w800),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'View All',
                              style: GoogleFonts.manrope(
                                  height: 150 / 100,
                                  fontSize: 14,
                                  color: const Color(0xfff8ED259),
                                  fontWeight: FontWeight.w600),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FutureBuilder<List<dynamic>>(
                      future: repo.fetchDataMakanan(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return SizedBox(
                            height: 250,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, int index) {
                                  var food = snapshot.data[index];
                                  return InkWell(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20),
                                      width: 220,
                                      height: 240,
                                      child: FutureBuilder<List<dynamic>>(
                                          future: repo.fetchDataMakanan(),
                                          builder: (context,
                                              AsyncSnapshot snapshot) {
                                            if (snapshot.hasData) {
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 220,
                                                    height: 140,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                food.gambar))),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    food.judul,
                                                    style: GoogleFonts.manrope(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        FeatherIcons.pieChart,
                                                        size: 12,
                                                        color:
                                                            Color(0xffB3B3B3),
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        food.kalori,
                                                        style:
                                                            GoogleFonts.manrope(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: const Color(
                                                              0xffB3B3B3),
                                                          height: 130 / 100,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      const Icon(
                                                        FeatherIcons.clock,
                                                        size: 12,
                                                        color:
                                                            Color(0xffB3B3B3),
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        food.waktu,
                                                        style:
                                                            GoogleFonts.manrope(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: const Color(
                                                              0xffB3B3B3),
                                                          height: 130 / 100,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.star,
                                                        size: 16,
                                                        color:
                                                            Color(0xffE8D213),
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        food.bintang,
                                                        style:
                                                            GoogleFonts.manrope(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: Colors.black,
                                                          height: 140 / 100,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        food.review,
                                                        style:
                                                            GoogleFonts.manrope(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: const Color(
                                                              0xffB3B3B3),
                                                          height: 140 / 100,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }
                                          }),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context){
                                            return DetailMakanan(food: food);
                                          }
                                        )
                                      );
                                    },
                                  );
                                }),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      })
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

Widget greetings() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'What are you\ncooking today?',
            style:
                GoogleFonts.manrope(fontSize: 28, fontWeight: FontWeight.w800),
          ),
          Container(
            // padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.bell,
                  size: 20,
                )),
          )
        ],
      ),
    );

Widget searchBar() => Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: const Icon(
              FeatherIcons.search,
              color: Color(0xfffb1b1b1),
            ),
            border: InputBorder.none,
            hintText: "Search any recipe...",
            hintStyle: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xfffB1B1B1),
                height: 170 / 100)),
      ),
    );

Widget banner() => AspectRatio(
      aspectRatio: 345 / 170,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color(0xfffA7DC63),
        ),
        child: Stack(
          children: [
            Image.asset(
              'assets/logo/banner.png',
              height: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cook the best\nrecipes at home',
                      style: GoogleFonts.manrope(
                          height: 150 / 100,
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          // ignore: deprecated_member_use
                          primary: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24))),
                      child: Text(
                        'Explore',
                        style: GoogleFonts.manrope(
                            color: const Color(0xfff7CBA2C),
                            fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget categories() => Align(
      alignment: AlignmentDirectional.topStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Categories',
              style: GoogleFonts.manrope(
                  fontSize: 24, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 36,
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                          color: selectedCategory == index
                              ? const Color(0xfff52AA0C)
                              : const Color(0xfffFFFFF),
                          borderRadius: BorderRadius.circular(24)),
                      child: Center(
                          child: Text(
                        category[index],
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.bold,
                            color: selectedCategory == index
                                ? const Color(0xfffFFFFF)
                                : const Color(0xfff868686).withOpacity(.5)),
                      )),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: category.length),
          )
        ],
      ),
    );
