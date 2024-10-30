import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Store donations in a local list
  List<Map<String, String>> donations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FeedingHands',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: donations.isEmpty
          ? _buildEmptyState()
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: donations.length,
          itemBuilder: (context, index) {
            final donation = donations[index];
            return _buildDonationCard(donation);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newDonation =
          await Navigator.pushNamed(context, '/add') as Map<String, String>?;
          if (newDonation != null) {
            setState(() {
              donations.add(newDonation);
            });
          }
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }

  // Widget for the empty state
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.fastfood_outlined,
            size: 80,
            color: Colors.teal,
          ),
          const SizedBox(height: 20),
          const Text(
            'No donations yet. Add some!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  // Widget for individual donation cards
  Widget _buildDonationCard(Map<String, String> donation) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal,
          child: const Icon(Icons.fastfood, color: Colors.white),
        ),
        title: Text(
          donation['item'] ?? 'Food Item',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Contact: ${donation['contact']}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.teal),
          onPressed: () {
            setState(() {
              donations.remove(donation);
            });
          },
        ),
      ),
    );
  }
}
