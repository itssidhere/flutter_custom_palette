// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'dart:async';
import 'dart:ui';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class FlutterCustomPalette {
  // static const MethodChannel _channel =
  //     const MethodChannel('flutter_custom_palette');
  //
  // static Future<String?> get platformVersion async {
  //   final String? version = await _channel.invokeMethod('getPlatformVersion');
  //   return version;
  // }

  Box? _palette;

  Future<void> init() async {
    //Use this method before calling any method on your instance
    _palette = await Hive.openBox('palette');
  }

  //Put the
  void put({@required String? key, @required Color? color}) {
    if (_palette == null) {
      throw ('Palette not initialized. Please call init() before using any method.');
    }

    _palette!.put(key, color!.value.toRadixString(16).toUpperCase());
  }

  Color get({@required String? key}) {
    if (_palette == null) {
      throw ('Palette not initialized. Please call init() before using any method.');
    }

    return Color(int.parse(_palette!.get(key), radix: 16));
  }

  ValueListenable<Box<dynamic>> getListenable({List<dynamic>? keys}) {
    if (_palette == null) {
      throw ('Palette not initialized. Please call init() before using any method.');
    }
    return _palette!.listenable(keys: keys);
  }

  Color getColor({@required String? color}) {
    return Color(int.parse(color!, radix: 16));
  }
}
