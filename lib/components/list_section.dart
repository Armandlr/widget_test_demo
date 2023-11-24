import 'package:flutter/material.dart';

class ListSection extends StatefulWidget {
  const ListSection({super.key});

  @override
  State<ListSection> createState() => _ListSectionState();
}

class _ListSectionState extends State<ListSection> {
  @override
  Widget build(BuildContext context) {
    List<String> list = ["1", "2", "3", "4", "5", "6"];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        key: const Key('listView'),
        itemCount: 6,
        itemBuilder: (context, index) {
          final item = list[index];
          return ListTile(
            title: Text(item),
          );
        },
      ),
    );
  }
}
