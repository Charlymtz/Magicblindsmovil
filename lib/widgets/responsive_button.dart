import 'package:flutter/material.dart';
import 'package:magicblinds/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  final String? routeName;

  ResponsiveButton({super.key, this.width = 120, this.isResponsive = false, this.routeName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (routeName != null) {
          Navigator.pushNamed(context, routeName!);
        }
      },
      child: Flexible(
        child: Container(
          width: isResponsive == true ? double.maxFinite : width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white30,
          ),
          child: Row(
            mainAxisAlignment: isResponsive == true ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
            children: [
              isResponsive == true
                  ? Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppText(text: "Buy Item Now", color: Colors.black, textAlign: TextAlign.center,),
              )
                  : Container(),
              Image.asset("img/boton.png"),
            ],
          ),
        ),
      ),
    );
  }
}
