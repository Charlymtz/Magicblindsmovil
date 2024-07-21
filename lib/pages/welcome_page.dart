import 'package:flutter/material.dart';
import 'package:magicblinds/widgets/app_large_text.dart';
import 'package:magicblinds/widgets/app_text.dart';
import 'package:magicblinds/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [ "animado2.png","animado1.png","animado3.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/" + images[index]),
                      fit: BoxFit.cover)),
              child: Container(
                margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Magic", color: Colors.white,),
                        AppText(text: "Blinds", size: 30, color: Colors.white70),
                        const SizedBox(height: 20,),
                        SizedBox(
                          width: 250,
                          child: AppText(
                            text: "Persianas sofisticadas, control sin esfuerzo",
                            color: Colors.white70,
                            size: 14,
                          ),
                        ),
                        const SizedBox(height: 40,),
                        ResponsiveButton(width: 120,routeName: '/HomePage',)
                      ],
                    ),
                    Column(
                      children: List.generate(3,(indexDots){
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index==indexDots?25:8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color:index==indexDots? Colors.white:Colors.white70.withOpacity(0.3)
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
