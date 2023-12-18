import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/identity_card_model.dart';
import '../../domain/services/exporter_service.dart';
import '../themes/color_schemes.g.dart';

class IdentityCardTile extends ConsumerStatefulWidget {
  const IdentityCardTile({
    super.key,
    required this.document,
    required this.onTap,
    this.isValid = false,
  });

  final IdentityCardModel document;
  final VoidCallback? onTap;
  final bool isValid;

  @override
  ConsumerState<IdentityCardTile> createState() => _IdentityCardTileState();
}

class _IdentityCardTileState extends ConsumerState<IdentityCardTile> {
  bool _isDownloading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: widget.onTap,
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: widget.document.cardImageUrl != null
                  ? Image.network(
                      widget.document.cardImageUrl!,
                      fit: BoxFit.contain,
                    )
                  : Image.asset(
                      'assets/images/dummyktp.png',
                      fit: BoxFit.contain,
                    ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.document.name ?? '-',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${widget.document.nik} - ${widget.document.gender}',
                        style: const TextStyle(fontSize: 10),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _download,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: lightColorScheme.primary,
                    minimumSize: const Size(20, 25),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                  ),
                  child: _isDownloading
                      ? const SizedBox(
                          width: 10,
                          height: 10,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text('Unduh', style: TextStyle(fontSize: 10)),
                ),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60,
                  height: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: widget.isValid ? Colors.green : Colors.red,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widget.isValid ? 'Valid' : 'Tidak Valid',
                      style: TextStyle(
                        color: widget.isValid ? Colors.green : Colors.red,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Text(
                  widget.document.createdAt?.toString() ?? '-',
                  style: const TextStyle(fontSize: 8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _download() async {
    if (_isDownloading) return;

    setState(() {
      _isDownloading = true;
    });

    try {
      await ref.read(exporterServiceProvider).exportToPdf(widget.document);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
    } finally {
      setState(() {
        _isDownloading = false;
      });
    }
  }
}
