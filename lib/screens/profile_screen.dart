import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("User Profile", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 16,
              child: Text("JD", style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.blue[200],
                          child: Text("JD", style: TextStyle(fontSize: 24, color: Colors.white)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 6, right: 4),
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text("Elite Member", style: TextStyle(fontSize: 10, color: Colors.white)),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Jane Doe", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("jane.doe@example.com", style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.edit, size: 16),
                      label: Text("Edit Profile"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo[400],
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            _buildSectionTitle("Account Settings"),
            _buildListTile(Icons.lock_outline, "Change Password", trailing: Icon(Icons.arrow_forward_ios, size: 14)),
            _buildListTile(Icons.email_outlined, "Email Preferences", trailingText: "Daily Digest"),
            _buildListTile(Icons.privacy_tip_outlined, "Privacy Settings", trailingText: "Enabled"),

            _buildSectionTitle("App Preferences"),
            _buildListTile(Icons.notifications_none, "Notifications", trailingText: "Enabled"),
            _buildListTile(Icons.card_giftcard, "Special Offers", trailingWidget: Switch(value: true, onChanged: (_) {})),
            _buildListTile(Icons.language, "Language", trailingText: "English (US)"),

            _buildSectionTitle("Recent Activity"),
            _buildActivityCard("Product Viewed: ElectroBook Pro", "Explored the latest features and specifications of the ElectroBook Pro laptop.", "2 hours ago"),
            _buildActivityCard("Order Placed: Quantum Headset", "Confirmed purchase of the Quantum Noise-Cancelling Headset.", "1 day ago"),
            _buildActivityCard("Referral Bonus Credited", "Earned rewards for a successful referral in the rewards program.", "3 days ago"),

            _buildSectionTitle("Support & Legal"),
            _buildListTile(Icons.help_outline, "Help & FAQ"),
            _buildListTile(Icons.article_outlined, "Terms of Service"),
            _buildListTile(Icons.shield_outlined, "Privacy Policy"),

            // Logout Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 48),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, {Widget? trailing, String? trailingText, Widget? trailingWidget}) {
    return ListTile(
      leading: Icon(icon, color: Colors.indigo),
      title: Text(title),
      trailing: trailing ?? trailingWidget ?? (trailingText != null ? Text(trailingText, style: TextStyle(color: Colors.grey[600])) : null),
    );
  }

  Widget _buildActivityCard(String title, String description, String timeAgo) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 4),
            Text(description, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(timeAgo, style: TextStyle(fontSize: 12, color: Colors.grey)),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye, size: 16),
                  label: Text("View Details"),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(80, 32),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
