// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:food/app/data/makanan.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

class QuickEasy extends StatefulWidget {
  const QuickEasy({super.key});

  @override
  State<QuickEasy> createState() => _QuickEasyState();
}

class _QuickEasyState extends State<QuickEasy> {
  // List<Makanan> detailMakanan = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffF0F6F4),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            navBar(),
            const SizedBox(
              height: 24,
            ),
            pilihanMenu()
          ],
        )),
      ),
    );
  }

  Widget navBar() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FeatherIcons.chevronLeft,
                    size: 20,
                  )),
            ),
            Text(
              'Quick & Easy',
              style: GoogleFonts.manrope(
                  fontSize: 28, fontWeight: FontWeight.w800),
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

  Widget pilihanMenu() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
            height:900,
            child: ListView(
              children: detailMakanan.map((food) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: 300,
                  height: 240,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 300,
                        height: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(food.gambar))),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        food.judul,
                        style: GoogleFonts.manrope(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
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
                            color: Color(0xffB3B3B3),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            food.kalori,
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xffB3B3B3),
                              height: 130 / 100,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Icon(
                            FeatherIcons.clock,
                            size: 12,
                            color: Color(0xffB3B3B3),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            food.waktu,
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xffB3B3B3),
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
                            color: Color(0xffE8D213),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            food.bintang,
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              height: 140 / 100,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            food.review,
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xffB3B3B3),
                              height: 140 / 100,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          )
      );
}
