import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Flutter code sample for [OverlayPortal].

class OverlayPortalExampleApp extends StatelessWidget {
  const OverlayPortalExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('OverlayPortal Example')),
        body: const Center(child: ClickableTooltipWidget()),
      ),
    );
  }
}

class ClickableTooltipWidget extends StatefulWidget {
  const ClickableTooltipWidget({super.key});

  @override
  State<StatefulWidget> createState() => ClickableTooltipWidgetState();
}

class ClickableTooltipWidgetState extends State<ClickableTooltipWidget> {
  final OverlayPortalController _tooltipController = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Builder(builder: (context2) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final renderBox = context2.findRenderObject() as RenderBox;
          final size = renderBox.size;
          print(size);
        });
        return TextButton(
          onPressed: _tooltipController.toggle,
          child: DefaultTextStyle(
            style: DefaultTextStyle.of(context).style.copyWith(fontSize: 50),
            child: OverlayPortal(
              controller: _tooltipController,
              overlayChildBuilder: (BuildContext ctx) {
                return const Positioned(
                  right: 608,
                  bottom: 72,
                  child: ColoredBox(
                    color: Colors.amberAccent,
                    child: Text('tooltip'),
                  ),
                );
              },
              child: const Text('Press to show/hide tooltip'),
            ),
          ),
        );
      }),
    ));
  }
}

class MyWidget extends HookWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final items = useState<List<String>>(['1', '2', '3']);
    final boolVal = useState<bool>(false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ses Kayıtları"),
      ),
      body: Consumer(builder: (context, ref, child) {
        return Container(
          child: ListView.builder(
              itemCount: items.value.length,
              itemBuilder: (context, index) {
                final currentItem = items.value[index];
                return ExpansionTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(currentItem),
                      Text(boolVal.value ? currentItem : 'Default Value')
                    ],
                  ),
                  onExpansionChanged: (bool visible) {
                    boolVal.value = visible;
                  },
                  children: [Text('data here $currentItem')],
                );
              }),
        );
      }),
    );
  }
}
