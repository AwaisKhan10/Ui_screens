// lib/presentation/pages/categories_page.dart
// ignore_for_file: use_key_in_widget_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zarafa_app/constants/colors.dart';
import 'package:zarafa_app/constants/text_style.dart';
import 'package:zarafa_app/presentation/providers/deatil_provider.dart';

class DetailPage extends StatelessWidget {
  String? imgUrl;
  DetailPage({required this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      /// Start Body
      ///
      body: ChangeNotifierProvider(
        create: (context) => DetailProvider(),
        child: Consumer<DetailProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              // physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ///
                  /// Header
                  ///
                  _header(imgUrl: imgUrl, contex: context),

                  ///
                  /// List DATA
                  ///
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // shrinkWrap: true,
                      children: [
                        ///
                        /// Rating
                        ///
                        _rating(),

                        ///
                        /// Text
                        ///
                        Text(
                          "Food",
                          style: style12,
                        ),
                        Text(
                          "Canton - Amman",
                          style: style25.copyWith(fontWeight: FontWeight.w600),
                        ),

                        ///
                        /// Tags
                        ///
                        _tags(),
                        const SizedBox(
                          height: 40,
                        ),

                        ///
                        /// Contact
                        ///
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _rowData(
                                img: "assets/icons/follow.png",
                                title: "Follow"),
                            _rowData(
                                img: "assets/icons/call.png", title: "Call"),
                            _rowData(
                                img: "assets/icons/email.png", title: "Email"),
                            _rowData(
                                img: "assets/icons/location.png",
                                title: "Direction"),
                            _rowData(
                                img: "assets/icons/report.png",
                                title: "Report"),
                            _rowData(
                                img: "assets/icons/share.png", title: "Share")
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        ///
                        /// Offers
                        ///
                        Row(
                          children: [
                            _buttonOffer(
                                index: provider.indexSelect == 0,
                                title: 'Available Offers',
                                onPressed: () {
                                  provider.setIndex(0);
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            _buttonOffer(
                                index: provider.indexSelect == 1,
                                title: 'Menu',
                                onPressed: () {
                                  provider.setIndex(1);
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            _buttonOffer(
                                index: provider.indexSelect == 2,
                                title: 'About',
                                onPressed: () {
                                  provider.setIndex(2);
                                }),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Available Offers", style: style18),
                            Row(
                              children: [
                                Text("How to use offers",
                                    style: style18.copyWith(
                                        fontSize: 16,
                                        color: const Color(
                                          0xffB2B2B2,
                                        ),
                                        fontWeight: FontWeight.w400)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  "assets/images/useOffer.png",
                                  scale: 4,
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        ///
                        /// Expansion Tile
                        ///
                        _expansionTile(provider, context),
                        _expansionTile(provider, context),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

_header({imgUrl, contex}) {
  return SizedBox(
    height: 330,
    child: Stack(alignment: Alignment.bottomLeft, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 288,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bg.png"),
                        fit: BoxFit.cover)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(contex);
                },
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.60),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: whiteColor,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),

      ///
      /// Profile Image Of Food
      Container(
        margin: const EdgeInsets.only(left: 20),
        height: 97,
        width: 97,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xffE9E9E9)),
            color: whiteColor,
            borderRadius: BorderRadius.circular(10)),
        child: Image.asset("$imgUrl"),
      )
    ]),
  );
}

_rating() {
  return Align(
    alignment: Alignment.topRight,
    child: Column(
      children: [
        Container(
          height: 30,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: purpleColor, width: 1.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/icons/star.png",
                scale: 4,
              ),
              Text(
                "4.1",
                style: style10.copyWith(color: purpleColor),
              )
            ],
          ),
        ),
        Text(
          "5k+ ratings",
          style: style10.copyWith(color: purpleColor),
        )
      ],
    ),
  );
}

_tags() {
  return Row(
    children: [
      Text(
        "Chinese # Chicken # Salads # Soup",
        style: style10,
      ),
      const SizedBox(
        width: 20,
      ),
      const Icon(
        Icons.circle,
        size: 5,
        color: blackColor,
      ),
      const SizedBox(
        width: 5,
      ),
      Text(
        "All tags",
        style: style14.copyWith(
            decoration: TextDecoration.underline, color: purpleColor),
      ),
    ],
  );
}

_rowData({img, title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        '$img',
        scale: 3,
      ),
      Text(
        "$title",
        style: style12,
      ),
    ],
  );
}

_buttonOffer({onPressed, title, index}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
            color: index ? lightPurpleColor : Color(0xff8F90A6), width: 1.0),
        color: index ? lightPurpleColor : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "$title",
        style: style18.copyWith(
            color: index ? purpleColor : const Color(0xff8F90A6), fontSize: 14),
      ),
    ),
  );
}

_dayCircleAvator({title}) {
  return Padding(
    padding: const EdgeInsets.only(right: 3.0),
    child: CircleAvatar(
      radius: 10,
      child: Text(
        '$title',
        style: style10.copyWith(color: purpleColor),
      ),
    ),
  );
}

_days() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        _dayCircleAvator(title: 'S'),
        _dayCircleAvator(title: 'M'),
        _dayCircleAvator(title: 'T'),
        _dayCircleAvator(title: 'W'),
        _dayCircleAvator(title: 'T'),
        _dayCircleAvator(title: 'F'),
        _dayCircleAvator(title: 'S'),
      ],
    ),
  );
}

_details0ffer(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "25% off total bill",
        style: style12.copyWith(color: whiteColor),
      ),
      SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.4,
        child: Text(
          "Available from 05:00 PM - 02:00 AM",
          style: style12.copyWith(color: whiteColor),
        ),
      ),

      ///
      /// Days
      ///
      _days(),
      SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.4,
        child: Text(
          "Min. spend of AED200.",
          style: style12.copyWith(color: whiteColor),
        ),
      ),
      SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.4,
        child: Text(
          "VALID TO 31 DEC 2022",
          style: style12.copyWith(color: whiteColor),
        ),
      ),
      Text(
        "View offer terms",
        style: style12.copyWith(
            decorationColor: whiteColor,
            decoration: TextDecoration.underline,
            color: whiteColor),
      ),
    ],
  );
}

_expansionTile(provider, context) {
  return ExpansionTile(
    title: Text(
      "Amman",
      style: style14,
    ),
    trailing: Icon(
      provider.customTileExpanded
          ? Icons.keyboard_arrow_up
          : Icons.keyboard_arrow_down,
    ),
    childrenPadding: const EdgeInsets.only(top: 10, bottom: 30),
    children: <Widget>[
      Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Unlock Offer",
              style: style14.copyWith(
                  decoration: TextDecoration.underline, color: purpleColor),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            'assets/images/lock.png',
            scale: 5,
          )
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Stack(
        alignment: Alignment.centerLeft,
        children: [
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xffFD01FF), Color(0xff01D9DC)])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: blackColor.withOpacity(0.40),
                          ),
                          child: Text(
                            'Flash deals',
                            style: style10.copyWith(color: whiteColor),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            'assets/icons/lock.png',
                            scale: 4,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/icons/vert.png',
                                  scale: 3,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                _details0ffer(context),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const CircleAvatar(
                radius: 20,
                backgroundColor: whiteColor,
              ),
            ],
          ),
          const CircleAvatar(
            radius: 20,
            backgroundColor: whiteColor,
          ),
        ],
      )
    ],
    onExpansionChanged: (bool expanded) {},
  );
}
