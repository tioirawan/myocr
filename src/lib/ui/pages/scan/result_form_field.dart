import 'package:flutter/material.dart';

class ResultFormField extends StatefulWidget {
  const ResultFormField({
    required this.title,
    super.key,
    this.controller,
    this.validator,
  });
  final String title;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<ResultFormField> createState() => _ResultFormFieldState();
}

class _ResultFormFieldState extends State<ResultFormField> {
  late final TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _controller,
            style: textTheme.bodyMedium,
            validator: widget.validator,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFE2E2E5).withOpacity(0.4),
              hintText: widget.title,
              hintStyle: textTheme.bodySmall,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .primary, // Warna outline saat difokuskan
                  width: 2.0, // Lebar outline saat difokuskan
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
