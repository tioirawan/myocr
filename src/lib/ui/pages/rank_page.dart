import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/custom_scaffold.dart';

class RankPage extends StatelessWidget {
  const RankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    // Replace this with your actual data
    List<Map<String, dynamic>> rankingList = [
      {'rank': 1, 'score': 85, 'name': 'John Doe', 'imageUrl': 'your_image_url_here'},
      {'rank': 2, 'score': 75, 'name': 'Jane Smith', 'imageUrl': 'your_image_url_here'},
      // Add more items as needed
    ];

    return CustomScaffold(
      body: Column(
        children: [
          AppBar(
            centerTitle: true,
            title: Text(
              'Perangkingan',
              style: TextStyle(
                color: colorScheme.onBackground,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: colorScheme.onBackground,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.download),
                color: colorScheme.onBackground,
                onPressed: () {
                  // Add your download functionality here
                },
              ),
            ],
            toolbarHeight: 60.0,
          ),
          const Divider(
            height: 0
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.background,
              child: ListView.builder(
                padding: const EdgeInsets.all(24),
                itemCount: rankingList.length,
                itemBuilder: (context, index) {
                  final rankingItem = rankingList[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Text(
                          '${rankingItem['rank']}',
                          style: textTheme.labelLarge!.apply(fontWeightDelta: 2),
                        ),
                        const SizedBox(width: 16),
                        // Image on the left
                        CircleAvatar(
                          backgroundImage: NetworkImage(rankingItem['imageUrl']),
                          radius: 18,
                        ),
                        const SizedBox(width: 16),
                        // Name with dynamic width
                        Expanded(
                          child: Text(
                            rankingItem['name'],
                            style: textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Score on the far right
                        Text(
                          '${rankingItem['score']}',
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}