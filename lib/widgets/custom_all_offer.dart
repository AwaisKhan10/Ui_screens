import 'package:flutter/material.dart';
import 'package:zarafa_app/constants/colors.dart';
import 'package:zarafa_app/constants/text_style.dart';
import 'package:zarafa_app/data/models/all_offer.dart';

class CustomAllOffer extends StatelessWidget {
  final AllOffer allOffer;
  CustomAllOffer({required this.allOffer});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: borderColor)),
          child: Image.asset(
            "${allOffer.imgURL}",
            scale: 2,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          "${allOffer.dishName}",
          style: style18,
        )
      ],
    );
  }
}
