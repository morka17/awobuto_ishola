//
// Generated file. Do not edit.
//

// ignore: unused_import
import 'dart:ui';

import 'package:flutter_web_image_picker/flutter_web_image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(PluginRegistry registry) {
  FlutterWebImagePicker.registerWith(registry.registrarFor(FlutterWebImagePicker));
  ImagePickerWeb.registerWith(registry.registrarFor(ImagePickerWeb));
  registry.registerMessageHandler();
}
