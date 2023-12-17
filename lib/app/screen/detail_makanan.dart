// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:food/app/data/model_makanan.dart';
import 'package:food/app/view%20model/fetch_makanan.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:food/app/data/makanan.dart';

class DetailMakanan extends StatelessWidget {
  final Makan food;
  DetailMakanan({Key? key, required this.food});

  Repository repo = Repository();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffF0F6F4),
      body: FutureBuilder(
          future: repo.fetchDataMakanan(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 350,
                    elevation: 0.0,
                    pinned: true,
                    stretch: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        food.gambar,
                        fit: BoxFit.cover,
                      ),
                      stretchModes: const [
                        StretchMode.blurBackground,
                        StretchMode.zoomBackground
                      ],
                    ),
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(0.0),
                      child: Container(
                        height: 32,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Color(0xfffF0F6F4),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24))),
                        child: Container(
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                              color: const Color(0xffCCCCCC),
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      ),
                    ),
                    leadingWidth: 800,
                    leading: Container(
                      margin: const EdgeInsets.only(left: 24, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              // padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              child: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(
                                    FeatherIcons.chevronLeft,
                                    size: 24,
                                    color: Colors.black,
                                  ))),
                          Container(
                              // padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    FeatherIcons.bell,
                                    size: 24,
                                    color: Colors.black,
                                  ))),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food.judul,
                            style: GoogleFonts.manrope(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const Icon(
                                FeatherIcons.pieChart,
                                size: 16,
                                color: Color(0xffB3B3B3),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                '${food.kalori} kalori',
                                style: GoogleFonts.manrope(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xffB3B3B3),
                                  height: 120 / 100,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Icon(
                                FeatherIcons.clock,
                                size: 16,
                                color: Color(0xffB3B3B3),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                '${food.waktu} menit',
                                style: GoogleFonts.manrope(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xffB3B3B3),
                                  height: 120 / 100,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 18,
                                color: Color(0xffE8D213),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                food.bintang,
                                style: GoogleFonts.manrope(
                                  fontSize: 14,
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xffB3B3B3),
                                  height: 130 / 100,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ingredients',
                                    style: GoogleFonts.manrope(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'How many servings?',
                                    style: GoogleFonts.manrope(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xffB3B3B3)),
                                  )
                                ],
                              ),
                              Container(
                                width: 120,
                                height: 34,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffCCCCCC)),
                                    borderRadius: BorderRadius.circular(24)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Icon(
                                        FeatherIcons.minus,
                                        size: 16,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        '02',
                                        style: GoogleFonts.manrope(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                      const Icon(
                                        FeatherIcons.plus,
                                        size: 16,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                              height: 300,
                              child: ListView(
                                children: [
                                  Container(
                                    height: 70,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: const Color(0xffCCCCCC)
                                                    .withOpacity(0.4),
                                                width: 1.2))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(food.ing1)))),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(food.jdl1,
                                            style: GoogleFonts.manrope(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black)),
                                        const SizedBox(
                                          width: 120,
                                        ),
                                        Text(food.bobot1,
                                            style: GoogleFonts.manrope(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    const Color(0xffB3B3B3))),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    height: 70,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: const Color(0xffCCCCCC)
                                                    .withOpacity(0.4),
                                                width: 1.2))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(food.ing2)))),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(food.jdl2,
                                            style: GoogleFonts.manrope(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black)),
                                        const SizedBox(
                                          width: 120,
                                        ),
                                        Text(food.bobot2,
                                            style: GoogleFonts.manrope(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    const Color(0xffB3B3B3))),
                                      ],
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
