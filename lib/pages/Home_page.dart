import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Image with Verified container
              Stack(
                children: [
                  Image.asset(
                    'lib/images/Room.png',
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                  const Positioned(
                    top: 8,
                    left: 8,
                    child: VerifiedContainer(),
                  ),
                ],
              ),

              const SizedBox(width: 15),

              // Villa details and feature chips
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Villa title and favorite icon
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Villa',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.favorite_border),
                      ],
                    ),

                    // Villa price
                    const Text(
                      'Rs.6999 Monthly',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Feature chips
                    Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: [
                        _buildFeatureChip('Fully Furnished'),
                        _buildFeatureChip('Washing Machine'),
                        _buildFeatureChip('Internet/Wifi'),
                        _buildFeatureChip('Attached Bathroom'),
                        _buildFeatureChip('Near Mall/Supermarket'),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Location
                    const Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 8),
                        Text('Location'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color.fromARGB(255, 114, 110, 110)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check,
            color: Color.fromARGB(255, 104, 181, 106),
            size: 13,
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 8,
            ),
          ),
        ],
      ),
    );
  }
}

class VerifiedContainer extends StatelessWidget {
  const VerifiedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.verified,
            color: Colors.blue,
            size: 16,
          ),
          SizedBox(width: 4),
          Text(
            'Verified',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(title: 'Villa Details'),
  ));
}
