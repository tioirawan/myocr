import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/theme_mode_provider.dart';
import '../providers/user_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final user = ref.watch(userNotifierProvider.select((state) => state.value));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pengaturan',
          style: TextStyle(
            color: colorScheme.onBackground,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 4.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: user?.photoUrl != null
                      ? CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(user!.photoUrl!),
                        )
                      : const CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/images/profile.png'),
                        ),
                ),
                const SizedBox(
                  width: 20,
                ), // Add spacing between the CircleAvatar and Text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user?.name ?? '-',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                    const SizedBox(height: 5),
                    Text(
                      user?.email ?? '-',
                      style: const TextStyle(
                        color: Colors
                            .grey, // Ganti dengan warna yang Anda inginkan
                        fontSize: 14, // Atur ukuran teks sesuai keinginan Anda
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      user?.phoneNumber ?? '-',
                      style: const TextStyle(
                        color: Colors
                            .grey, // Ganti dengan warna yang Anda inginkan
                        fontSize: 14, // Atur ukuran teks sesuai keinginan Anda
                      ),
                    )
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text('Pengaturan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onBackground,
                    textStyle: textTheme.bodyLarge,
                    padding: const EdgeInsets.all(0.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.dark_mode_rounded,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Dark Mode',
                      ),
                      const Spacer(),
                      Consumer(builder: (context, ref, _) {
                        final themeMdoe =
                            ref.watch(themeModeNotifierProvider).value;

                        return Switch(
                          value: themeMdoe == ThemeMode.dark,
                          onChanged: (value) {
                            if (value) {
                              ref
                                  .read(themeModeNotifierProvider.notifier)
                                  .setThemeMode(ThemeMode.dark);
                            } else {
                              ref
                                  .read(themeModeNotifierProvider.notifier)
                                  .setThemeMode(ThemeMode.light);
                            }
                          },
                        );
                      }),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.pushNamed(
                      context,
                      '/profile/edit',
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onBackground,
                    textStyle: textTheme.bodyLarge,
                    padding: const EdgeInsets.all(0.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.edit_rounded,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text('Edit Profil'),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/about',
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onBackground,
                    textStyle: textTheme.bodyLarge,
                    padding: const EdgeInsets.all(0.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Tentang Kami',
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await ref.read(userNotifierProvider.notifier).logout();

                    if (context.mounted) {
                      Navigator.pushNamed(context, '/');
                    }
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    textStyle: textTheme.bodyLarge,
                    padding: const EdgeInsets.all(0.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.logout,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text('Log Out'),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
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
