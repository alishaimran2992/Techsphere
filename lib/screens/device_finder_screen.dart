import 'package:flutter/material.dart';

class DeviceFinderScreen extends StatefulWidget {
  @override
  _DeviceFinderScreenState createState() => _DeviceFinderScreenState();
}

class _DeviceFinderScreenState extends State<DeviceFinderScreen> {
  String? selectedRAM;
  String? selectedROM;
  String? selectedScreenSize;

  final TextEditingController budgetController = TextEditingController();
  final TextEditingController cameraController = TextEditingController();
  final TextEditingController batteryController = TextEditingController();

  final List<Map<String, String>> devices = [
    {
      'name': 'Samsung Galaxy S23 Ultra',
      'ram': '12GB',
      'rom': '256GB',
      'screen': '6.8"',
      'price': '\$1199',
      'image': 'https://i.imgur.com/XNnR8kX.png',
    },
    {
      'name': 'iPhone 15 Pro Max',
      'ram': '8GB',
      'rom': '256GB',
      'screen': '6.7"',
      'price': '\$1099',
      'image': 'https://i.imgur.com/DKvN1Qg.png',
    },
    {
      'name': 'Google Pixel 8 Pro',
      'ram': '12GB',
      'rom': '128GB',
      'screen': '6.7"',
      'price': '\$899',
      'image': 'https://i.imgur.com/K6tOuyb.png',
    },
    {
      'name': 'Xiaomi 14 Ultra',
      'ram': '16GB',
      'rom': '512GB',
      'screen': '6.73"',
      'price': '\$999',
      'image': 'https://i.imgur.com/t3NYb8C.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Device Finder',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage("https://i.imgur.com/QCNbOAo.png"),
                  radius: 20,
                ),
              ],
            ),
            SizedBox(height: 16),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 20),

            // Filter Card
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Filter Device Specifications', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 16),

                  // Budget
                  TextField(
                    controller: budgetController,
                    decoration: InputDecoration(
                      labelText: 'Budget',
                      hintText: 'e.g., \$500 - \$1000',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 12),

                  // RAM Dropdown
                  DropdownButtonFormField<String>(
                    value: selectedRAM,
                    onChanged: (val) => setState(() => selectedRAM = val),
                    items: ['4GB', '8GB', '12GB', '16GB'].map((ram) {
                      return DropdownMenuItem(value: ram, child: Text(ram));
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'RAM',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),

                  // ROM Dropdown
                  DropdownButtonFormField<String>(
                    value: selectedROM,
                    onChanged: (val) => setState(() => selectedROM = val),
                    items: ['64GB', '128GB', '256GB', '512GB'].map((rom) {
                      return DropdownMenuItem(value: rom, child: Text(rom));
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'ROM',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),

                  // Screen Size Dropdown
                  DropdownButtonFormField<String>(
                    value: selectedScreenSize,
                    onChanged: (val) => setState(() => selectedScreenSize = val),
                    items: ['6.1"', '6.5"', '6.7"', '6.8"'].map((screen) {
                      return DropdownMenuItem(value: screen, child: Text(screen));
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Screen Size',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),

                  // Camera Megapixels
                  TextField(
                    controller: cameraController,
                    decoration: InputDecoration(
                      labelText: 'Camera Megapixels',
                      hintText: 'e.g., 48MP+',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),

                  // Battery Life
                  TextField(
                    controller: batteryController,
                    decoration: InputDecoration(
                      labelText: 'Battery Life',
                      hintText: 'e.g., 4000 mAh+',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Button
                  ElevatedButton(
                    onPressed: () {
                      // Add logic for suggestions
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text('Get Device Suggestions'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Recommended Devices
            Text('Recommended Devices', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: devices.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.68,
              ),
              itemBuilder: (context, index) {
                final device = devices[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(device['image']!, fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(device['name']!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(height: 4),
                      Text('${device['ram']} RAM', style: TextStyle(fontSize: 12)),
                      Text('${device['rom']} ROM  ${device['screen']}', style: TextStyle(fontSize: 12)),
                      SizedBox(height: 4),
                      Text(device['price']!, style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
