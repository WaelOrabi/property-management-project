import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:advance_image_picker/configs/image_picker_configs.dart';
import 'package:advance_image_picker/models/image_object.dart';
import 'package:advance_image_picker/widgets/editors/editor_params.dart';
import 'package:advance_image_picker/widgets/editors/image_edit.dart';
import 'package:advance_image_picker/widgets/picker/image_picker.dart';

class AddPhotoAdvanceImage extends StatefulWidget {
  final List<ImageObject> listImagesProperty;

  const AddPhotoAdvanceImage({Key? key, required this.listImagesProperty})
      : super(key: key);

  @override
  State<AddPhotoAdvanceImage> createState() => _AddPhotoAdvanceImageState();
}

class _AddPhotoAdvanceImageState extends State<AddPhotoAdvanceImage> {
  List<ImageObject> listImagesProperty = [];

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
                builder: (context) => ImageEdit(
                    file: file,
                    title: title,
                    maxWidth: maxWidth,
                    maxHeight: maxHeight,
                    configs: configs))));
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          widget.listImagesProperty.isEmpty
              ? const SizedBox(
                  width: 0,
                  height: 0,
                )
              : Row(
                  children:
                      List.generate(widget.listImagesProperty.length, (index) {
                    final image = widget.listImagesProperty[index];
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(6),
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(File(
                                image.modifiedPath,
                              )),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                widget.listImagesProperty
                                    .remove(widget.listImagesProperty[index]);
                              });
                            },
                            icon: const Icon(
                              Icons.dangerous_outlined,
                              color: Colors.white,
                            ))
                      ],
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
                final List<ImageObject>? objects = await Navigator.of(context)
                    .push(
                        PageRouteBuilder(pageBuilder: (context, animation, __) {
                  return const ImagePicker(maxCount: 100);
                }));
                if ((objects?.length ?? 0) > 0) {
                  setState(() {
                    widget.listImagesProperty.addAll(objects!);
                    // print("***************");
                    print("***************uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
                    print(widget.listImagesProperty[0].modifiedPath);
                    print(widget.listImagesProperty[1].modifiedPath);
                    print(widget.listImagesProperty[2].modifiedPath);
                    print(widget.listImagesProperty[3].modifiedPath);
                    print(widget.listImagesProperty[4].modifiedPath);
                    print(widget.listImagesProperty[5].modifiedPath);
                    print(widget.listImagesProperty[6].modifiedPath);
                    print(widget.listImagesProperty[7].modifiedPath);
                    print(widget.listImagesProperty[8].modifiedPath);
                    print(widget.listImagesProperty[9].modifiedPath);
                    print(widget.listImagesProperty[10].modifiedPath);
                    print(widget.listImagesProperty[11].modifiedPath);
                    print(widget.listImagesProperty[12].modifiedPath);
                    print(widget.listImagesProperty[13].modifiedPath);
                    print(widget.listImagesProperty[14].modifiedPath);
                    print(widget.listImagesProperty[15].modifiedPath);
                    print(widget.listImagesProperty[16].modifiedPath);
                    print(widget.listImagesProperty[17].modifiedPath);
                    print(widget.listImagesProperty[18].modifiedPath);
                    print(widget.listImagesProperty[19].modifiedPath);
                    print(widget.listImagesProperty[20].modifiedPath);
                    print(widget.listImagesProperty[21].modifiedPath);
                    // print("***************");
                    // // print("***************uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
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
