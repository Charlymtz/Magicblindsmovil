import 'package:flutter/material.dart';
import 'package:magicblinds/widgets/app_large_text.dart';
import 'package:magicblinds/widgets/app_text.dart';
import 'detail_page.dart';
import 'navpages/my_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final List<Map<String, String>> imageDetails = [
    {
      "imagePath": "img/persianas.png",
      "title": "Bamboo Blinds",
      "material": "Natural Bamboo",
      "price": "\$250",
      "description":
      "Add a touch of nature to your home with our Bamboo Blinds. Made from sustainable bamboo, these blinds offer a natural look that brings warmth and tranquility to any room. Perfect for creating a serene and eco-friendly environment."
    },
    {
      "imagePath": "img/persianas2.png",
      "title": "Velvet Drapes",
      "material": "Plush Velvet",
      "price": "\$300",
      "description":
      "Elevate your space with our luxurious Velvet Drapes. Crafted from plush velvet fabric, these drapes add a sophisticated touch to your decor. Their rich texture and elegant appearance create an inviting and opulent atmosphere in any room."
    },
    {
      "imagePath": "img/persianas3.png",
      "title": "Cocoa Blinds",
      "material": "Rich Cocoa Fabric",
      "price": "\$350",
      "description":
      "Introducing our Cocoa Blinds, designed to blend style and functionality. Featuring a deep, warm hue reminiscent of rich cocoa, these blinds provide excellent light control while enhancing your interior with a cozy and refined aesthetic."
    },
  ];

  final Map<String, String> exploreImages = {
    "blind.png": "Blinds",
    "prices.png": "Price",
    "questions.png": "Questions"
  };

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menu bar
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
              child: Row(
                children: [
                  const Icon(Icons.menu, size: 30, color: Colors.black87),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyPage()),
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.withOpacity(0.4),
                        image: const DecorationImage(
                          image: AssetImage('img/profpic.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Discover text
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: AppLargeText(text: "Comfort and Tech", color: Colors.black87),
            ),
            const SizedBox(height: 20),
            // TabBar
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                controller: tabController,
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.grey[700],
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: Colors.lightBlueAccent, radius: 6),
                tabs: const [
                  Tab(text: "Products"),
                  Tab(text: "Inspiration"),
                  Tab(text: "About Us"),
                ],
              ),
            ),
            SizedBox(
              height: 400,
              child: TabBarView(
                controller: tabController,
                children: [
                  // Products tab
                  ListView.builder(
                    itemCount: imageDetails.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                imagePath: imageDetails[index]["imagePath"]!,
                                title: imageDetails[index]["title"]!,
                                material: imageDetails[index]["material"]!,
                                price: imageDetails[index]["price"]!,
                                description: imageDetails[index]["description"]!,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 20, top: 20, bottom: 20, left: 10),
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 4,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage(imageDetails[index]["imagePath"]!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        imageDetails[index]["title"]!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        imageDetails[index]["material"]!,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        imageDetails[index]["price"]!,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  // Inspiration tab
                  SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [Colors.blue[50]!, Colors.blue[100]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'img/persianas4.png',
                              width: 300,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Our mission is to create smarter, more comfortable living spaces. Our automated blinds blend convenience with technology, adjusting to ambient temperature for optimal comfort. This project embodies our commitment to innovation, allowing you to effortlessly monitor and control your blinds from your phone for a new level of home automation.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // About Us tab
                  SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [Colors.blue[50]!, Colors.blue[100]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('img/team.png'),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'About Us',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'We are a team of passionate innovators dedicated to making your home smarter and more comfortable. Our automated blinds project is driven by the desire to blend convenience with cutting-edge technology, providing a seamless and intuitive experience for you to control and monitor your home environment.',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Explore more section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppLargeText(
                    text: "Explore More",
                    size: 22,
                    color: Colors.black87,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Acción al hacer clic en "see all"
                    },
                    child: const AppText(
                      text: "See All",
                      color: Colors.lightBlueAccent,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Explore more images
            Container(
              height: 160,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                itemCount: exploreImages.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 4,
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage("img/${exploreImages.keys.elementAt(index)}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        AppText(
                          text: exploreImages.values.elementAt(index),
                          color: Colors.black87,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  CircleTabIndicator({required this.color, this.radius = 6.0});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainter({required this.color, this.radius = 6.0});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final Offset circleOffset = offset + Offset(
        configuration.size!.width / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, paint);
  }
}
