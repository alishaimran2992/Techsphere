import 'package:flutter/material.dart';

// This is the main screen widget for the product page.
class ZFoldScreen extends StatelessWidget {
  const ZFoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            // TODO: Implement navigation back
            Navigator.pop(context);
          },
        ),
        title: const Text('TechSphere Z-Fold Pro'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Implement settings action
              print('Settings tapped!');
            },
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product Image Carousel
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  PageView(
                    children: [
                      Image.network(
                        'https://images.unsplash.com/photo-1621609764095-b9e326442807?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://images.unsplash.com/photo-1510511459019-517316acbd8a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    left: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        2, // Number of images in the carousel
                            (index) => Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(index == 0 ? 1 : 0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Product Info Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ElectroSuggest Z-Fold Pro',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        '\$1799.99',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '\$1999.99',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[100],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          '10% OFF',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ...List.generate(5, (index) {
                        return Icon(
                          index < 4 ? Icons.star : Icons.star_half,
                          color: Colors.amber,
                          size: 16,
                        );
                      }),
                      const SizedBox(width: 8),
                      const Text(
                        '4.7/5.0',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '245 Reviews',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(height: 1, thickness: 1),

            // About This Product Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'About This Product',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Introducing the revolutionary ElectroSuggest Z-Fold Pro, a foldable smartphone designed to redefine your digital experience. Unfold a stunning cinematic display for immersive gaming and entertainment, or use the compact form factor for on-the-go convenience. Powered by the next-gen Snapdragon 8 Gen 3 chipset, a pro-grade camera system, and all-day battery life, the Z-Fold Pro seamlessly combines power, functionality, and elegance. Its durable hinge technology ensures it stands up to everyday use for power users and tech enthusiasts.",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),

            const Divider(height: 1, thickness: 1),

            // Technical Specifications Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Technical Specifications',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildSpecRow('Display', '6.7-inch Super AMOLED'),
                  _buildSpecRow('Processor', 'Snapdragon 8 Gen 3'),
                  _buildSpecRow('RAM', '12GB LPDDR5X'),
                  _buildSpecRow('Storage', '256GB/512GB'),
                  _buildSpecRow('Camera', '50MP OIS + 12MP UW + 10MP Tele'),
                  _buildSpecRow('Battery', '5000 mAh'),
                  _buildSpecRow('Operating System', 'Android 14'),
                  _buildSpecRow('Connectivity', '5G, Wi-Fi 7, Bluetooth 5.4'),
                  _buildSpecRow('Weight', '190g'),
                ],
              ),
            ),

            const Divider(height: 1, thickness: 1),

            // User Reviews Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'User Reviews',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildReviewItem('Alex Johnson', 4, 'April 20, 2024',
                      "This phone is a game changer! The screen is beautiful and the camera takes really sharp photos. Battery life is impressive too, highly recommend for anyone looking for a premium device."),
                  const SizedBox(height: 16),
                  _buildReviewItem('Sophie Miller', 3, 'April 18, 2024',
                      "Overall, a decent smart phone. The performance is top-notch, and it handles everything I throw at it with ease. My one issue is that it can feel a bit large for one-handed use, but still great."),
                  const SizedBox(height: 16),
                  _buildReviewItem('David Chen', 5, 'April 11, 2024',
                      "Absolutely blown away by the speed and fluidity of this device. From gaming to multitasking, it doesn't skip a beat. The foldable screen feels truly premium to hold."),
                ],
              ),
            ),

            const Divider(height: 1, thickness: 1),

            // Action Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Implement "Add to Wishlist" action
                    },
                    icon: const Icon(Icons.favorite_border),
                    label: const Text('Add to Wishlist'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: () {
                      // TODO: Implement "Recommend to a Friend" action
                    },
                    icon: const Icon(Icons.ios_share),
                    label: const Text('Recommend to a Friend'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.deepPurple,
                      side: const BorderSide(color: Colors.deepPurple),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Made with Visily Footer
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Made with',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper widget for a single specification row
Widget _buildSpecRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      children: [
        SizedBox(
          width: 120, // Fixed width for labels
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(color: Colors.black54),
          ),
        ),
      ],
    ),
  );
}

// Helper widget for a single review item
Widget _buildReviewItem(String name, int rating, String date, String reviewText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.deepPurple,
            child: Text(
              name.substring(0, 1),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  ...List.generate(5, (index) {
                    return Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 14,
                    );
                  }),
                  const SizedBox(width: 4),
                  Text(
                    'Posted on $date',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 8),
      Text(reviewText),
    ],
  );
}