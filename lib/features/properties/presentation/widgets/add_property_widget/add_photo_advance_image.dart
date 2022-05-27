import 'dart:io';
import 'package:advance_image_picker/configs/image_picker_configs.dart';
import 'package:advance_image_picker/models/image_object.dart';
import 'package:advance_image_picker/widgets/editors/editor_params.dart';
import 'package:advance_image_picker/widgets/editors/image_edit.dart';
import 'package:advance_image_picker/widgets/editors/image_sticker.dart';
import 'package:advance_image_picker/widgets/picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddPhotoAdvanceImage extends StatefulWidget {
  const AddPhotoAdvanceImage({Key? key}) : super(key: key);

  @override
  State<AddPhotoAdvanceImage> createState() => _AddPhotoAdvanceImageState();
}

class _AddPhotoAdvanceImageState extends State<AddPhotoAdvanceImage> {

  List<ImageObject> imgObjs = [];
  @override
  Widget build(BuildContext context) {

    final configs = ImagePickerConfigs();
    configs.translateFunc = (name, value) => Intl.message(value, name: name);
    configs.externalImageEditors['external_image_editor_1'] = EditorParams(
        title: 'external_image_editor_1',
        icon: Icons.edit_rounded,
        onEditorEvent: (
            {required BuildContext context,
              required File file,
              required String title,
              int maxWidth = 1080,
              int maxHeight = 1920,
              int compressQuality = 90,
              ImagePickerConfigs? configs}) async =>
            Navigator.of(context).push(MaterialPageRoute<File>(
                fullscreenDialog: true,
                builder: (context) => ImageEdit(
                    file: file,
                    title: title,
                    maxWidth: maxWidth,
                    maxHeight: maxHeight,
                    configs: configs))));
    configs.externalImageEditors['external_image_editor_2'] = EditorParams(
        title: 'external_image_editor_2',
        icon: Icons.edit_attributes,
        onEditorEvent: (
            {required BuildContext context,
              required File file,
              required String title,
              int maxWidth = 1080,
              int maxHeight = 1920,
              int compressQuality = 90,
              ImagePickerConfigs? configs}) async =>
            Navigator.of(context).push(MaterialPageRoute<File>(
                fullscreenDialog: true,
                builder: (context) => ImageSticker(
                    file: file,
                    title: title,
                    maxWidth: maxWidth,
                    maxHeight: maxHeight,
                    configs: configs))));

    // Example about label detection & OCR extraction feature.
    // You can use Google ML Kit or TensorflowLite for this purpose
    configs.labelDetectFunc = (String path) async {
      return <DetectObject>[
        DetectObject(label: 'dummy1', confidence: 0.75),
        DetectObject(label: 'dummy2', confidence: 0.75),
        DetectObject(label: 'dummy3', confidence: 0.75)
      ];
    };
    configs.ocrExtractFunc =
        (String path, {bool? isCloudService = false}) async {
      if (isCloudService!) {
        return 'Cloud dummy ocr text';
      } else {
        return 'Dummy ocr text';
      }
    };

    // Example about custom stickers
    configs.customStickerOnly = true;
    configs.customStickers = [
      'assets/icon/cus1.png',
      'assets/icon/cus2.png',
      'assets/icon/cus3.png',
      'assets/icon/cus4.png',
      'assets/icon/cus5.png'
    ];


    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          imgObjs.isEmpty
              ? Container(
            width: 0,
            height: 0,
          )
              : Row(
            children:
            List.generate(imgObjs.length, (index) {
              final image = imgObjs[index];
              return Container(
                margin: const EdgeInsets.all(6),
                width:
                MediaQuery.of(context).size.width /
                    4,
                height:
                MediaQuery.of(context).size.width /
                    4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(
                      image.modifiedPath,
                    )),
                    fit: BoxFit.cover,
                  ),
                  borderRadius:
                  BorderRadius.circular(10),
                  color: Colors.green,
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: const Icon(
                  Icons.photo_camera,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              onTap: () async {
                final List<ImageObject>? objects =
                await Navigator.of(context).push(
                    PageRouteBuilder(pageBuilder:
                        (context, animation, __) {
                      return const ImagePicker(maxCount: 100);
                    }));

                if ((objects?.length ?? 0) > 0) {
                  setState(() {
                    imgObjs = objects!;
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
