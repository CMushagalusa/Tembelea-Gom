import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tembelea_goma/misc/colors.dart';
import 'package:tembelea_goma/widgets/apa_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.width=120, this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive==true?double.maxFinite:width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor
        ),
        child: Row(
          mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
          children: [
            isResponsive==true?Container(margin: const EdgeInsets.only(left: 10),
                child: AppText(text: "Book A Guide Now", color: Colors.white)):Container(),
            Image.asset("images/button-one.png"),
          ],
        ),
      ),
    );
  }
}
