import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'json_editor_controller_notifier.g.dart';

@Riverpod(keepAlive: true)
class JsonEditorControllerNotifier extends _$JsonEditorControllerNotifier {
  late final TextEditingController _controller;

  @override
  TextEditingController build() {
    _controller = TextEditingController();
    ref.onDispose(() {
      _controller.dispose();
    });
    return _controller;
  }

  void updateText(String newText) {
    if (_controller.text != newText) {
      _controller.text = newText;
    }
  }
}
