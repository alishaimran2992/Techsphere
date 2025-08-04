import 'package:flutter/material.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Browse Categories',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const SizedBox(),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            color: Colors.black,
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.indigo[100],
              child: const Text('JD'),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search electronic categories...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Trending Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildTrendingCard(
                  title: 'Smartphones',
                  subtitle: 'Discover the latest models and',
                  imageUrl: 'https://i.imgur.com/v5ZgMh9.png',
                  isPopular: true,
                ),
                const SizedBox(width: 10),
                _buildTrendingCard(
                  title: 'Smart Home Devices',
                  subtitle: 'Automate your living space with smart',
                  imageUrl: 'https://i.imgur.com/dO4aY6n.png',
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'All Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildCategoryCard(
                  title: 'Laptops & PCs',
                  subtitle: 'High-performance machines for work',
                  imageUrl: 'https://i.imgur.com/NAl1cmz.png',
                ),
                _buildCategoryCard(
                  title: 'Audio Devices',
                  subtitle: 'Headphones, speakers, and sound',
                  imageUrl: 'https://i.imgur.com/oDnPCvJ.png',
                ),
                _buildCategoryCard(
                  title: 'Wearables',
                  subtitle: 'Smartwatches, fitness trackers, and',
                  imageUrl: 'https://i.imgur.com/UV2AfUl.png',
                ),
                _buildCategoryCard(
                  title: 'Cameras',
                  subtitle: 'Capture moments with high-quality',
                  imageUrl: 'https://i.imgur.com/cPtSxgA.png',
                ),
                _buildCategoryCard(
                  title: 'Gaming Gear',
                  subtitle: 'Consoles, accessories, and',
                  imageUrl: 'https://i.imgur.com/mEDbnEv.png',
                ),
                _buildCategoryCard(
                  title: 'Drones',
                  subtitle: 'Explore the skies with advanced aerial',
                  imageUrl: 'https://i.imgur.com/rVxyU0W.png',
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendingCard({
    required String title,
    required String subtitle,
    required String imageUrl,
    bool isPopular = false,
  }) {
    return Expanded(
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              blurRadius: 4,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(imageUrl, height: 60),
                const SizedBox(height: 10),
                Text(title,
                    style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            if (isPopular)
              Positioned(
                right: 0,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Popular',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required String subtitle,
    required String imageUrl,
  }) {
    return SizedBox(
      width: 160,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              blurRadius: 4,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, height: 60),
            const SizedBox(height: 10),
            Text(title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 14)),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
