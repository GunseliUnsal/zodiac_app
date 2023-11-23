import 'package:flutter/material.dart';
import 'package:zodiac_app/constants.dart';
import 'package:zodiac_app/data.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [gradientStartColor, gradientEndColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(38.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Zodiac Signs",
                      style: TextStyle(
                          fontFamily: "Avenir", fontSize: 44, color: Colors.white, fontWeight: FontWeight.w900),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 62,
                    ),
                    SizedBox(
                      height: 500,
                      child: Swiper(
                        itemCount: zodiacs.length,
                        itemWidth: MediaQuery.of(context).size.width - 2 * 62,
                        layout: SwiperLayout.STACK,
                        pagination: const SwiperPagination(
                            builder: DotSwiperPaginationBuilder(
                          activeSize: 20,
                        )),
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 100,
                                  ),
                                  Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(56.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 100,
                                          ),
                                          Text(
                                            zodiacs[index].name,
                                            style: const TextStyle(
                                                fontFamily: "Avenir",
                                                fontSize: 28,
                                                color: Color(0xff47455f),
                                                fontWeight: FontWeight.w900),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            zodiacs[index].date,
                                            style: const TextStyle(
                                                fontFamily: "Avenir",
                                                fontSize: 12,
                                                color: Color(0xff47455f),
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.left,
                                          ),
                                          const SizedBox(
                                            height: 32,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                'Know more',
                                                style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 18,
                                                  color: secondaryTextColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Icon(
                                                Icons.arrow_forward,
                                                color: secondaryTextColor,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 20, // Adjust the position as needed
                                child: Container(
                                  width: 200, // Adjust the size as needed
                                  height: 200, // Adjust the size as needed
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      zodiacs[index].iconImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
