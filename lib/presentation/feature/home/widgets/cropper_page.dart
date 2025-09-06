
import 'dart:io';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CropperPage extends StatefulWidget {
  final File imageFile;

  const CropperPage({super.key, required this.imageFile});

  @override
  State<CropperPage> createState() => _CropperPageState();
}

class _CropperPageState extends State<CropperPage> {
  final _controller = CropController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            // Crop view
            Expanded(
              child: Crop(
                image: widget.imageFile.readAsBytesSync(),
                controller: _controller,
                aspectRatio: 1,
                withCircleUi: false,
                onCropped: (result) async {
                  switch (result) {
                    case CropSuccess(:final croppedImage):
                      final tempDir = await getTemporaryDirectory();
                      final file = File('${tempDir.path}/cropped_${DateTime.now().millisecondsSinceEpoch}.png');
                      await file.writeAsBytes(croppedImage);
                      Navigator.pop(context, file);

                    case CropFailure(:final cause):
                      debugPrint("Cropping failed: $cause");
                      Navigator.pop(context, null);
                  }
                },
              ),
            ),

            // Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
                  ElevatedButton(onPressed: () => _controller.crop(), child: const Text("Save")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}