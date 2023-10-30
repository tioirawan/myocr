import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akun Saya',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 1,
            thickness: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align everything to the left
              children: [
                CircleAvatar(
                  radius: 40, // Adjust the size as needed
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                SizedBox(
                  width: 20,
                ), // Add spacing between the CircleAvatar and Text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Vladimir Putin',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                    SizedBox(height: 5),
                    Text('vladimirputin@gmail.com'),
                    SizedBox(height: 5),
                    Text('083848492377')
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text('Pengaturan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/profile/edit',
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onBackground,
                    textStyle: Theme.of(context).textTheme.bodySmall,
                    padding: const EdgeInsets.all(0.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.edit_rounded),
                      SizedBox(width: 10),
                      Text('Edit Profil', style: TextStyle(fontSize: 18)),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/about',
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onBackground,
                    textStyle: Theme.of(context).textTheme.bodySmall,
                    padding: const EdgeInsets.all(0.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.info_outline_rounded),
                      SizedBox(width: 10),
                      Text(
                        'Tentang Kami',
                        style: TextStyle(fontSize: 18),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/login',
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    textStyle: Theme.of(context).textTheme.bodySmall,
                    padding: const EdgeInsets.all(0.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.logout),
                      SizedBox(width: 10),
                      Text('Log Out', style: TextStyle(fontSize: 18)),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
