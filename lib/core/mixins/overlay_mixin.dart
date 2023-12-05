import 'package:flutter/material.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';

mixin OverlayMixin<T extends StatefulWidget> on State<T> {
  OverlayEntry? _overlayEntry;

  bool get _showOverlay => _overlayEntry != null;

  void toggleOverlay({required Widget child, Offset? offset}) {
    final renderBox = context.findRenderObject() as RenderBox;
    final localToGlobal = renderBox.localToGlobal(Offset.zero);
    final width = context.screenWidth;
    if (localToGlobal > Offset(width - 60, 0)) {
      offset = localToGlobal - const Offset(50, 0);
    } else {
      offset = localToGlobal;
    }
    _showOverlay ? removeOverlay() : _insertOverlay(child: child);
  }

  void removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _insertOverlay({required Widget child, Offset? offset}) {
    _overlayEntry = OverlayEntry(
      builder: (_) => _dismissableOverlay(child: child, offset: offset),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  Widget _dismissableOverlay({required Widget child, Offset? offset}) {
    return Positioned(
      left: offset?.dx,
      top: offset?.dy,
      child: GestureDetector(
        onTap: removeOverlay,
        child: child,
      ),
    );
  }

  @override
  void dispose() {
    removeOverlay();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    removeOverlay();
    super.didChangeDependencies();
  }
}
