import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class KeyValueStorageListener<T> extends StatefulWidget {
  const KeyValueStorageListener({
    super.key,
    required this.box,
    this.keys,
    required this.builder,
    this.closeOnDispose = false,
  });
  final Box<T> box;
  final List<String>? keys;

  /// if you want to close your box when disposing set [closeOnDispose] to true
  final bool closeOnDispose;
  final Widget Function(Box<T> bx) builder;

  @override
  State<KeyValueStorageListener<T>> createState() =>
      _KeyValueStorageListenerState();
}

class _KeyValueStorageListenerState<T>
    extends State<KeyValueStorageListener<T>> {
  late Box<T> _box;

  void _valueChanged() {
    _box = widget.box;
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    _box = widget.box;
    _box.listenable(keys: widget.keys).addListener(_valueChanged);
    super.initState();
  }

  @override
  void dispose() {
    _box.listenable(keys: widget.keys).removeListener(_valueChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_box);
  }
}
