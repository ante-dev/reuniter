import 'package:flutter/material.dart';
import 'search_page.dart'; // Import the SearchPage

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBar(),
            const SizedBox(height: 16),
            const CategoryGrid(),
            const SizedBox(height: 16),
            RecentlyLostList(),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Wrap in GestureDetector
      onTap: () {
        // Navigate to the SearchPage when the search bar is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchPage()),
        );
      },
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          hintText: 'Search for Lost items...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      childAspectRatio: 1.5,
      crossAxisCount: 3,
      physics: const NeverScrollableScrollPhysics(), // Disable GridView scrolling
      children: const [
        CategoryCard(icon: Icons.perm_identity, label: 'ID Cards'),
        CategoryCard(icon: Icons.account_balance_wallet, label: 'Wallets'),
        CategoryCard(icon: Icons.description, label: 'Certificates'),
        CategoryCard(icon: Icons.vpn_key, label: 'Keys'),
        CategoryCard(icon: Icons.phone_android, label: 'Phones'),
        CategoryCard(icon: Icons.work, label: 'Bags'),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: Colors.blue),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class RecentlyLostList extends StatelessWidget {
  final List<Map<String, String>> recentlyLostItems = [
    {'item': 'National ID', 'date': '12th Sept, 2024'},
    {'item': 'Wallet', 'date': '10th Sept, 2024'},
    {'item': 'National ID', 'date': '12th Sept, 2024'},
    {'item': 'Wallet', 'date': '10th Sept, 2024'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // Ensure ListView takes minimal space
      physics: const NeverScrollableScrollPhysics(), // Disable ListView scrolling
      itemCount: recentlyLostItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.credit_card, size: 30, color: Colors.grey),
          title: Text(recentlyLostItems[index]['item']!),
          subtitle: Text('Lost on: ${recentlyLostItems[index]['date']}'),
        );
      },
    );
  }
}