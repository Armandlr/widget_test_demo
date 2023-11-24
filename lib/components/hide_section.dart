import 'package:flutter/material.dart';

class HideSection extends StatefulWidget {
  const HideSection({super.key});

  @override
  State<HideSection> createState() => _HideSectionState();
}

class _HideSectionState extends State<HideSection> {
  bool _hide = false;

  void _handleHide() {
    setState(() {
      _hide = !_hide;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            key: const Key('hideWidgetButton'),
            onPressed: _handleHide,
            child: Text('Press to ${_hide ? 'hide' : 'show'} widget')),
        const SizedBox(
          height: 12,
        ),
        if (_hide) ...[
          const Text('This is the hidden widget'),
          const SizedBox(
            height: 12,
          ),
        ] else
          const SizedBox.shrink(),
      ],
    );
  }
}
