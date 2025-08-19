
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {

  Uint8List? _image;

  Future<void> _pickImage() async {
      final ImagePickerPlugin picker = ImagePickerPlugin();
      final pickedFile = await picker.getImageFromSource(
        source: ImageSource.gallery
      );
      if(pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();

      setState(() {
        _image = bytes;
      });
      }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
      ),
      body: Center(
        child: Column(children: [
          _image != null
              ? Image.memory(_image!) // ! is used to assert that _image is not null
              : Text('No image selected'),
          ElevatedButton(onPressed: _pickImage, child: Text('Choose Image')),
        ],),
      ),
    );
  }
}