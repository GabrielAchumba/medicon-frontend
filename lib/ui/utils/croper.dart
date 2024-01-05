import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

Future<CroppedFile?> cropImage(BuildContext context,
        {required File file,
        List<CropAspectRatioPreset>? aspectRatios,
        CropAspectRatioPreset? initAspectRatio,
        Color? color,
        bool? lockRatio}) =>
    ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatioPresets: aspectRatios ??
          [
            CropAspectRatioPreset.square
            // CropAspectRatioPreset.ratio3x2,
            // CropAspectRatioPreset.original,
            // CropAspectRatioPreset.ratio4x3,
            // CropAspectRatioPreset.ratio16x9
          ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: color,
            activeControlsWidgetColor: color,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: initAspectRatio ?? CropAspectRatioPreset.original,
            lockAspectRatio: lockRatio ?? false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
