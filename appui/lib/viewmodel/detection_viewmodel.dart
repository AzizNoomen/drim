// ignore: file_names
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../model/detection_model.dart';

class CameraGalleryViewModel extends ChangeNotifier {
  bool _loading = true;
  File? _image;
  late ImageClassifierModel _model;

  CameraGalleryViewModel() {
    _model = ImageClassifierModel();
    _model.loadModel().then((value) {
      notifyListeners();
    });
  }

  Future<void> pickImage() async {
    var picker = ImagePicker();
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    _image = File(image.path);
    await _model.classifyImage(_image!);
    _loading = false;
    notifyListeners();
  }

  Future<void> takePhoto() async {
    var picker = ImagePicker();
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    }
    _image = File(image.path);
    await _model.classifyImage(_image!);
    _loading = false;
    notifyListeners();
  }

  File? get image => _image;

  bool get loading => _loading;

  List<dynamic> get output => _model.output;

  void dispose() {
    _model.dispose();
    super.dispose();
  }
}
