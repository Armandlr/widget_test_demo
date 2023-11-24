import 'package:flutter/material.dart';

class DialogSection extends StatefulWidget {
  const DialogSection({super.key});

  @override
  State<DialogSection> createState() => _DialogSectionState();
}

class _DialogSectionState extends State<DialogSection> {
  Future<void> _showDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Riga dialog'),
          content: const Text(
            'This dialog is showing and the text needs to be tested.',
          ),
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            key: const Key('showDialogButton'),
            onPressed: () => _showDialog(context),
            child: const Text('Show dialog')),
        const SizedBox(
          height: 12,
        )
      ],
    );
  }
}
