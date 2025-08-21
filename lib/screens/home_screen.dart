import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'TechSphere Recommends',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.notifications_none),
                      SizedBox(width: 10),
                      CircleAvatar(
                        radius: 16,
                        backgroundImage: AssetImage('assets/images/profile.jpg'),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),

              // Welcome Banner
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, Tech Sphere!',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Discover the latest and greatest electro devices tailored just for you.',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      child: Text('Start Exploring'),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Quick Categories
              Text(
                'Quick Categories',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildCategoryCard('Smartphone', 120),
                  _buildCategoryCard('Laptops', 85),
                  _buildCategoryCard('Wearables', 50),
                ],
              ),
              SizedBox(height: 20),

              // Personalized Picks
              Text(
                'Personalized Picks',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.68,
                children: [
                  _buildProductCard('iPhone 15 Pro Max', 'images/Apple-iPhone-15-Pro.jpg', 4.9, '\$1199.00'),
                  _buildProductCard('MacBook Pro 14"', 'images/macbook 14.jpg', 4.7, '\$1999.00'),
                  _buildProductCard('Galaxy Watch 6 Classic', 'images/watch6-classic-silver.jpg', 4.5, '\$329.00'),
                  _buildProductCard('Sony WH-1000XM5', 'images/sony wh.jpg', 4.8, '\$348.00'),
                ],
              ),
              SizedBox(height: 12),

              // Featured Brands
              Text(
                'Featured Brands',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Wrap(
                alignment: WrapAlignment.spaceAround,
                spacing: 20,
                runSpacing: 12,
                children: [
                  _buildBrandIcon('images/Apple-Logo.jpg'),
                  _buildBrandIcon('images/samsung-logo-png.png'),
                  _buildBrandIcon('images/sony-logo-png.png'),
                  _buildBrandIcon('images/Huawei-Logo.png'),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, int count) {
    return Container(
      width: 90,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Icon(Icons.devices_other, size: 36),
              Positioned(
                top: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    '$count',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildProductCard(String title, String imagePath, double rating, String price) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(imagePath, height: 100, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite_border, color: Colors.red),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, size: 14, color: Colors.amber),
                    SizedBox(width: 4),
                    Text('$rating', style: TextStyle(fontSize: 12)),
                  ],
                ),
                SizedBox(height: 4),
                Text(price, style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(30),
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.blue),
                  ),
                  child: Text('View Details', style: TextStyle(color: Colors.blue, fontSize: 12)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBrandIcon(String path) {
    return Image.asset(path, width: 100, height: 100);
  }
}
