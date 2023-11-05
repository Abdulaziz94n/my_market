import 'package:flutter/material.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({super.key, this.title, this.onPressed});
  final String? title;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, con) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title ?? 'Default Screen'),
          actions: [
            IconButton(onPressed: onPressed, icon: const Icon(Icons.abc))
          ],
        ),
        body: Column(
          children: [
            Center(
              child: Text(title ?? 'Default Screen'),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('text')),
          ],
        ),
      );
    });
  }
}
