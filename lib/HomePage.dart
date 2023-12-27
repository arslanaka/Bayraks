import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:js' as js;

class MyHomePage extends StatelessWidget {

  late GoogleMapController mapController;

  final List<String> featuredItems = [
    'assets/item1.jpeg',
    'assets/item2.jpeg',
    'assets/item3.jpeg',
  ];

  final List<String> featured = [
    'assets/istanbul2.jpg',
    'assets/istanbul3.jpg',
    'assets/istanbul5.jpg',
    'assets/istanbul6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container 1: Slider
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Text(
                      'Bayrak\'s Catering',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'DM Serif Display',

                      ),
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.75,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      enlargeCenterPage: false,
                    ),
                    items: featured.map((imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            // Container 2: Stay in the Loop Text, Email Field, and Featured Menu Items
            SizedBox(
              width: MediaQuery.of(context).size.width,

              child: Padding(
                padding: const EdgeInsets.all(24.0), // Adjust the padding as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Stay in the Loop',
                        style: TextStyle(
                          fontFamily: 'DM Serif Display',
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25), // Round corners for the white background
                            border: Border.all(
                              color: Colors.red, // Border color
                              width: 2, // Border width
                            ),
                          ),
                          child: Row(
                            children: [
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6, height: 18),
                              ElevatedButton(
                                onPressed: () {
                                  // Implement sign-up functionality
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                  ),
                                ),
                                child: const Text('Sign Up'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(34.0),
                      child: Text(
                        'Featured Items',
                        style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'DM Serif Display',
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Wrap(
                        spacing: 20.0,
                        runSpacing: 20.0,
                        alignment: WrapAlignment.center,
                        children: [
                          _buildCard('assets/pistachio-baklava.jpg', 'Pistachio baklava', '80.00'),
                          _buildCard('assets/sut-halwa.jpg', 'Sut halwa', '35.00'),
                          _buildCard('assets/walnut-baklava.jpg', 'Walnut baklava', '70.00'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Container 3: Background Image
            Container (
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/turkey.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Stack( //map child
                children: [
                  Positioned(
                    top: 70,
                    left: 100,
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        width: 500,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: AssetImage('assets/map.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 680,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Location & Hours',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '1136 Virginia Lane\nConcord, CA 94520\n(925)250-2708\n\nDkbrands24@gmail.com',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 0.5
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () {
                            js.context.callMethod('open', ['https://www.google.com/maps/place/37%C2%B057\'26.3%22N+122%C2%B002\'33.0%22W/@37.9573072,-122.0450779,17z/data=!3m1!4b1!4m4!3m3!8m2!3d37.957303!4d-122.042503?entry=ttu']);
                          },
                          child: const Text(
                            'Get directions',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Monday 09:00 am - 05:00 pm\n'
                              'Tuesday 09:00 am - 05:00 pm\n'
                              'Wednesday 09:00 am - 05:00 pm\n'
                              'Thursday 09:00 am - 05:00 pm\n'
                              'Friday 09:00 am - 05:00 pm\n'
                              'Saturday 09:00 am - 05:00 pm\n'
                              'Sunday Closed',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),            // Container 4: Additional Container
            Container(
        width: double.infinity,
        height: 100, // Adjust the height as needed
        color: Colors.grey, // Set the desired background color or remove this line for transparency
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '© 2023 Bayrak\'s Catering. All Rights Reserved',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                '\nPrivacy Policy | Terms & Conditions',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
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
  }

  Widget _buildCard(String imagePath,String itemName,String price) {
    return Container(
      width: 300,
      height: 350,
      child: Column(
        children: [
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    imagePath,
                    height: 300,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
           Text(
            itemName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('\$$price'),
        ],
      ),
    );
  }




}
