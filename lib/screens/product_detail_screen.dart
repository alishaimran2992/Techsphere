import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          'TechSphere  Z-Fold Pro',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage('assets/images/zfold.jpg'), // Replace with actual path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Title & Price
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ElectroSuggest Z-Fold Pro', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Brand: InnovateTech', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text('\$1799.99', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)),
                      SizedBox(width: 10),
                      Text('\$1999.99', style: TextStyle(decoration: TextDecoration.lineThrough)),
                      SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text('10% OFF', style: TextStyle(fontSize: 12)),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.orange),
                      Text(' (4.7 / 5.0) - 245 Reviews', style: TextStyle(fontSize: 13, color: Colors.grey)),
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 20),

            // About
            Text('About This Product', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              'Experience the future with the ElectroSuggest Z-Fold Pro, a revolutionary foldable smartphone designed for ultimate productivity and entertainment...',
              style: TextStyle(color: Colors.black87, height: 1.5),
            ),

            SizedBox(height: 20),

            // Technical Specs
            Text('Technical Specifications', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            _buildSpecRow('Display', '6.7-inch Super AMOLED'),
            _buildSpecRow('Processor', 'Snapdragon 8 Gen 3'),
            _buildSpecRow('RAM', '12GB LPDDR5X'),
            _buildSpecRow('Storage', '256GB UFS 4.0'),
            _buildSpecRow('Camera', '50MP + 12MP UW + 10MP Tele'),
            _buildSpecRow('Battery', '5000mAh'),
            _buildSpecRow('Operating System', 'Android 14'),
            _buildSpecRow('Connectivity', '5G, Wi-Fi 7, Bluetooth 5.4'),
            _buildSpecRow('Weight', '198g'),

            SizedBox(height: 20),

            // User Reviews
            Text('User Reviews', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            _buildReview('AJ', 'Alex Johnson', 'April 20, 2024',
                'This phone is a game-changer! The screen is incredibly vibrant, and the camera takes stunning photos. Battery life is impressive too. Highly recommend!'),
            _buildReview('SM', 'Sophia Miller', 'April 18, 2024',
                'Overall, a fantastic smartphone. The performance is top-notch, and it handles everything I throw at it with ease.'),
            _buildReview('DC', 'David Chen', 'April 15, 2024',
                'Absolutely blown away by the speed and fluidity of this device. The design is sleek, and it feels premium in hand.'),

            SizedBox(height: 20),

            // Buttons
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 48),
              ),
              child: Text('Add to Wishlist'),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(minimumSize: Size(double.infinity, 48)),
              child: Text('Recommend to a Friend'),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(label, style: TextStyle(fontWeight: FontWeight.w500))),
          Expanded(flex: 3, child: Text(value, style: TextStyle(color: Colors.grey.shade700))),
        ],
      ),
    );
  }

  Widget _buildReview(String initials, String name, String date, String comment) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(child: Text(initials), radius: 18),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Reviewed on $date', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            Text(comment, style: TextStyle(height: 1.4)),
            SizedBox(height: 4),
            Icon(Icons.thumb_up_alt_outlined, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
