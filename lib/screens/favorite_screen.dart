import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  final List<Map<String, dynamic>> wishlistItems = [
    {
      'name': 'NeoConnect Wireless Headphones',
      'brand': 'AudioPhile',
      'price': '\$199.99',
      'reviews': 128,
      'rating': 2,
      'status': 'In Stock',
      'date': '2023-10-26',
      'image': 'assets/images/headphones.png',
    },
    {
      'name': 'ChromaFlow RGB Gaming Keyboard',
      'brand': 'GameGear Pro',
      'price': '\$120.00',
      'reviews': 85,
      'rating': 4,
      'status': 'Limited Stock',
      'date': '2023-10-20',
      'image': 'assets/images/keyboard.png',
    },
    {
      'name': 'ProLens 4K Portable Projector',
      'brand': 'Visionary Tech',
      'price': '\$450.00',
      'reviews': 205,
      'rating': 3,
      'status': 'In Stock',
      'date': '2023-10-15',
      'image': 'assets/images/projector.png',
    },
  ];

  Widget buildRatingStars(int rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.blue,
          size: 16,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Wishlist'),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
          CircleAvatar(backgroundImage: AssetImage('assets/images/user.png')),
          SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: RichText(
                text: TextSpan(
                  text: 'Total Items in Wishlist\n',
                  style: TextStyle(color: Colors.black54),
                  children: [
                    TextSpan(
                      text: '${wishlistItems.length} items',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: wishlistItems.length,
                itemBuilder: (context, index) {
                  final item = wishlistItems[index];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(item['image'], width: 80, height: 80),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                Text(item['brand'], style: TextStyle(color: Colors.grey)),
                                Text(item['price'], style: TextStyle(color: Colors.blue, fontSize: 16)),
                                Row(
                                  children: [
                                    buildRatingStars(item['rating']),
                                    SizedBox(width: 5),
                                    Text('(${item['reviews']} reviews)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                    SizedBox(width: 8),
                                    Chip(
                                      label: Text(item['status']),
                                      backgroundColor: item['status'] == 'In Stock' ? Colors.green.shade100 : Colors.orange.shade100,
                                      labelStyle: TextStyle(color: item['status'] == 'In Stock' ? Colors.green : Colors.orange),
                                    )
                                  ],
                                ),
                                Text('Added on: ${item['date']}', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    IconButton(icon: Icon(Icons.delete_outline), onPressed: () {}),
                                    Spacer(),
                                    ElevatedButton.icon(
                                      icon: Icon(Icons.shopping_cart_outlined),
                                      label: Text('Purchase Now'),
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.indigo,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
