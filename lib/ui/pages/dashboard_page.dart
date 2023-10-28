import 'package:flutter/material.dart';
import '../themes/color_schemes.g.dart';

class DashboardPage extends StatelessWidget {
  final Map<String, String> userData = const{
    'name': 'John Doe',
    'profileImage': 'assets/profile_pic.jpg',
  };

  final List<Map<String, dynamic>> transactionHistory = const [
    {
      'id': '1',
      'name': 'John Doe',
      'nik': '1234567890',
      'gender': 'Laki-laki',
      'isValid': true,
      'lastAccessed': '20 Aug 2023, 08.00 PM', // Replace this with the actual last accessed date and time
    },
    {
      'id': '2',
      'name': 'Jane Smith',
      'nik': '0987654321',
      'gender': 'Perempuan',
      'isValid': false,
      'lastAccessed': '20 Jan 2023, 09.00 AM',
    },
    // ... Add more transaction data here as needed
  ];

  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20, left: 20, right: 20, bottom: 20),
            child: Row(
              children: <Widget>[
                const Text(
                  'Selamat Datang, ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${userData['name']}!',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(userData['profileImage']!),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 8.0),
            child: Text(
              'Riwayat',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              children: transactionHistory.map((transaction) {
                return _buildKTPCard(
                  transaction['id'] as String,
                  transaction['name'] as String,
                  transaction['nik'] as String,
                  transaction['gender'] as String,
                  transaction['isValid'] as bool,
                  transaction['lastAccessed'] as String,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKTPCard(
      String transactionID,
      String name,
      String nik,
      String gender,
      bool isValid,
      String lastAccessed,
      ) {
    return Card(
      margin: const EdgeInsets.all(6),
      child: ListTile(
        contentPadding: const EdgeInsets.only(top: 0, bottom: 0, left: 12, right: 12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            width: 100,
            child: Image.network(
              'https://www.bloranews.com/wp-content/uploads/2018/08/PERSIAPAN-PEMILU-2019-DINDUKCAPIL-BLORA-BUTUH-30-RIBU-KEPING-BLANKO-E-KTP.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$nik-$gender',
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Action for the 'Unduh' button
                print('Unduh button tapped for $transactionID');
              },
              style: ElevatedButton.styleFrom(
                primary: lightColorScheme.primary,
                onPrimary: Colors.white,
                minimumSize: const Size(20, 25),
                padding: const EdgeInsets.symmetric(horizontal: 14),
              ),
              child: const Text('Unduh', style: TextStyle(fontSize: 10)),
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isValid ? Colors.green : Colors.red,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  isValid ? 'Valid' : 'Tidak Valid',
                  style: TextStyle(
                    color: isValid ? Colors.green : Colors.red,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Text(
              lastAccessed,
              style: const TextStyle(fontSize: 8),
            ),
          ],
        ),
      ),
    );
  }
}
