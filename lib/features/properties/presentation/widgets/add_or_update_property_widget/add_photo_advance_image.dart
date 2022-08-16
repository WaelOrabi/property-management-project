import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddPhotoAdvanceImage extends StatefulWidget {
  final List<XFile> listImagesProperty;

  const AddPhotoAdvanceImage({Key? key, required this.listImagesProperty})
      : super(key: key);

  @override
  State<AddPhotoAdvanceImage> createState() => _AddPhotoAdvanceImageState();
}

class _AddPhotoAdvanceImageState extends State<AddPhotoAdvanceImage> {


  final ImagePicker imagePicker = ImagePicker();



  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      widget.listImagesProperty.addAll(selectedImages);
    }
    setState(() {
    });
  }
  List<XFile> listImagesProperty = [];

  @override
  Widget build(BuildContext context) {

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
            children: List.generate(widget.listImagesProperty.length, (index) {
              final image = widget.listImagesProperty[index];
              return Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(6),
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File(image.path,
                        )),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      widget.listImagesProperty.remove(widget.listImagesProperty[index]);
                    });
                  }, icon:const Icon(Icons.dangerous_outlined,color: Colors.white,) )
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
                for(int i=0;i<widget.listImagesProperty.length;i++) {
                  print("#####################################3");
                  print(widget.listImagesProperty[i].path);
selectImages();


}           },
            ),
          )
        ],
      ),
    );
  }
}
