import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vegetables/models/vegetable_model.dart';

class VegetableList extends StatelessWidget {
  const VegetableList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0),
        itemCount: vegetables.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            width: double.infinity,
            height: 160,
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Flexible(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  width: 177,
                  height: 128,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffdbd8dd),
                  ),
                  child: Image.asset(
                    vegetables[index].imageUrl,
                  ),
                ),
              ),
              SizedBox(
                width: 177,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                        child: Text(
                          vegetables[index].name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.41,
                            color: Color(0xff2d0c57),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 43, 12),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                vegetables[index].price.toString(),
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.41,
                                  color: Color(0xff2d0c57),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                '€ /${vegetables[index].unit.name}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.41,
                                  color: Color(0xff9586a8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(1, 0, 0, 0),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              width: 78,
                              height: 40,
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  backgroundColor: const Color(0xFFFFFFFF),
                                ),
                                child: SvgPicture.asset(
                                  'assets/svg/heart.svg',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: SizedBox(
                              width: 78,
                              height: 40,
                              child: IconButton(
                                color: const Color(0xFF0BCE83),
                                icon: SvgPicture.asset(
                                  'assets/svg/shopping-cart.svg',
                                  width: 20,
                                  height: 20,
                                ),
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  backgroundColor: const Color(0xFF0BCE83),
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
            ]),
          );
        },
      ),
    );
  }
}