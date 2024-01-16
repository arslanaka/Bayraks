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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Container 1: Slider
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5, // Adjust as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Bayrak\'s Catering',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.4, // Adjust as needed
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
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Stay in the Loop',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6, // Adjust as needed
                      margin: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Expanded(
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
                          SizedBox(width: 6),
                          ElevatedButton(
                            onPressed: () {
                              // Implement sign-up functionality
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            child: Text('Sign Up'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Featured Items',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
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
            // Container 3: Background Image
            Container(
              height: MediaQuery.of(context).size.height * 0.5, // Adjust as needed
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/turkey.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 60,
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5, // Adjust as needed
                        height: MediaQuery.of(context).size.height * 0.3, // Adjust as needed
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage('assets/map.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location & Hours',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '1136 Virginia Lane\nConcord, CA 94520\n(925)250-2708\n\nDkbrands24@gmail.com',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 8),
                        TextButton(
                          onPressed: () {
                            js.context.callMethod('open',
                                ['https://www.google.com/maps/place/37%C2%B057\'26.3%22N+122%C2%B002\'33.0%22W/@37.9573072,-122.0450779,17z/data=!3m1!4b1!4m4!3m3!8m2!3d37.957303!4d-122.042503?entry=ttu']);
                          },
                          child: Text(
                            'Get directions',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Monday - Friday: 09:00 am - 05:00 pm\nSaturday: 09:00 am - 05:00 pm\nSunday: Closed',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Container 4: Additional Container
            Container(
              height: 100, // Adjust as needed
              color: Colors.grey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '© 2023 Bayrak\'s Catering. All Rights Reserved',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Privacy Policy | Terms & Conditions',
                      style: TextStyle(
                        fontSize: 10,
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
