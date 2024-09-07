import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyBagPage(),
    );
  }
}

class MyBagPage extends StatelessWidget {
  const MyBagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bag'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: _buildListView(),
    );
  }

  Column _buildListView() {
    return Column(
      children: [
        // List of products with scrolling
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: 10, // Repeat the card 10 times
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Product Image with Fallback Icon
                                _buildImage(),
                                const SizedBox(width: 16.0),
                                // Product details and controls
                                Expanded(
                                  child: _buildHeadingTitleSize(),
                                ),
                                // Quantity controls and price
                                _buildPrice(),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Product Image with Fallback Icon
                                _buildImage(),
                                const SizedBox(width: 16.0),
                                // Product details and controls
                                Expanded(
                                  child: _buildHeadingTitleSize(),
                                ),
                                // Quantity controls and price
                                _buildPrice(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ));
              },
            ),
          ),
        ),
        // Total amount and Checkout button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              // Total amount
              _buildTotalAmount(),
              const SizedBox(height: 16.0),
              // Checkout Button
              SizedBox(
                width: double.infinity,
                child: _buildButton(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: () {
        // Checkout logic
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red, // Button color
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: const Text(
        'CHECK OUT',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildTotalAmount() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total amount:',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '1234\$',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  Widget _buildPrice() {
    return const Column(
      children: [
        Text(
          '64\$',
          style: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ],
    );
  }

  Widget _buildHeadingTitleSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const Text(
              'Pullover',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                //color: Colors.green
              ),
            ),
            const SizedBox(height: 8.0),
            const Row(
              children: [
                Text('Color: Black'),
                SizedBox(width: 16.0),
                Row(
                  children: [
                    Text('Size: '),
                    Text(
                      'L',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                const Text('1'),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImage() {
    return SizedBox(
      height: 80,
      width: 80,
      child: Image.network(
        'https://example.com/your_image_url',
        // replace with your valid image URL
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          // Fallback Icon if image fails to load
          return const Icon(
            Icons.shopping_bag,
            // Use any icon like Icons.person or Icons.shopping_bag
            size: 50,
            color: Colors.red,
          );
        },
      ),
    );
  }
}
