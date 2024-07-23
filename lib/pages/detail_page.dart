import 'package:flutter/material.dart';
import 'package:magicblinds/widgets/app_buttons.dart';
import 'package:magicblinds/widgets/app_large_text.dart';
import 'package:magicblinds/widgets/app_text.dart';
import 'package:magicblinds/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  final String imagePath;
  final String title;
  final String material;
  final String price;
  final String description;

  const DetailPage({
    required this.imagePath,
    required this.title,
    required this.material,
    required this.price,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            // Image header
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0.3), Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            ),
            // Back button
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Content container
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 320,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: widget.title,
                            color: Colors.black.withOpacity(0.9),
                            size: 24,
                          ),
                          AppLargeText(
                            text: widget.price,
                            color: Colors.lightBlue,
                            size: 24,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Material
                      Row(
                        children: [
                          const Icon(Icons.tune, color: Colors.lightBlue),
                          const SizedBox(width: 5),
                          AppText(
                            text: widget.material,
                            color: Color(0xFF6D6E71),
                            textAlign: TextAlign.center,
                            size: 16,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Rating
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: index < gottenStars
                                    ? Colors.yellow
                                    : Colors.grey,
                              );
                            }),
                          ),
                          const SizedBox(width: 10),
                          AppText(
                            text: "(4.0)",
                            color: Color(0xFF6D6E71),
                            textAlign: TextAlign.center,
                            size: 16,
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      // Number of items
                      AppLargeText(
                        text: "Number of items",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const SizedBox(height: 5),
                      AppText(
                        text: "Select quantity",
                        color: Color(0xFF6D6E71),
                        textAlign: TextAlign.center,
                        size: 16,
                      ),
                      const SizedBox(height: 10),
                      // Quantity buttons
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButtons(
                                size: 50,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: selectedIndex == index
                                    ? Colors.lightBlue
                                    : Colors.grey[300]!,
                                borderColor: selectedIndex == index
                                    ? Colors.lightBlue
                                    : Colors.grey[400]!,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      // Description
                      AppLargeText(
                        text: "Description",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const SizedBox(height: 10),
                      AppText(
                        text: widget.description,
                        color: Color(0xFF6D6E71),
                        textAlign: TextAlign.center,
                        size: 16,
                      ),
                      const SizedBox(height: 20),
                      // Buttons
                      Row(
                        children: [
                          AppButtons(
                            size: 60,
                            color: Colors.lightBlue,
                            backgroundColor: Colors.white,
                            borderColor: Colors.lightBlue,
                            isIcon: true,
                            icon: Icons.favorite_border,
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: ResponsiveButton(
                              isResponsive: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
