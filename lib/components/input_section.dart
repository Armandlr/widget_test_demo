import 'package:flutter/material.dart';

class InputSection extends StatefulWidget {
  const InputSection({super.key});

  @override
  State<InputSection> createState() => _InputSectionState();
}

class _InputSectionState extends State<InputSection> {
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
            key: const Key('textField'),
            controller: inputController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                // won't be used if the state-specific arguments are defined
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            )),
        // TextFormField(
        //     key: const Key('textField1'),
        //     controller: inputController,
        //     decoration: const InputDecoration(
        //       border: OutlineInputBorder(
        //         // won't be used if the state-specific arguments are defined
        //         borderRadius: BorderRadius.all(Radius.circular(10)),
        //       ),
        //     )),
        const SizedBox(
          height: 12,
        ),
        ElevatedButton(
            key: const Key('showTextButton'),
            onPressed: () => setState(() {}),
            child: const Text('Show input text')),
        Padding(
          padding:
              EdgeInsets.only(bottom: inputController.text.isNotEmpty ? 12 : 0),
          child: Text(inputController.text),
        ),
      ],
    );
  }
}
