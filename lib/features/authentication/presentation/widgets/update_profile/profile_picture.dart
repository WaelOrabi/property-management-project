// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Profile_Picture extends StatefulWidget {
   Profile_Picture({Key? key,this.image}) : super(key: key);
 File? image;
  @override
  State<Profile_Picture> createState() => _Profile_PictureState();
}
class _Profile_PictureState extends State<Profile_Picture> {


  Future getImage(ImageSource src) async {
    final pickedFile = await ImagePicker().pickImage(source: src);
    setState(() {
      if (pickedFile != null) {
        widget.image = File(pickedFile.path);
      }
    });
    return widget.image;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          widget.image == null
              ? const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.white,
                  ),
                  radius: 150,
                )
              : CircleAvatar(
                  backgroundImage: FileImage(widget.image!),
                  radius: 130,
                ),
          Positioned(
            left: 100,
            top: 100,
            child: IconButton(
              icon:const Icon(Icons.add_a_photo),
              color: Colors.green,
              iconSize: 30,
              onPressed: () {
                var ad = AlertDialog(
                  title:const Text("chose photo from :"),
                  content: SizedBox(
                    height: 150,
                    child: Column(
                      children: [
                        const Divider(
                          height: 10,
                        ),
                        Container(
                          color: Theme.of(context).primaryColor,
                          child: ListTile(
                            leading:const  Icon(Icons.photo),
                            title:const  Text("Gallery"),
                            onTap: () {
                              getImage(ImageSource.gallery);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Theme.of(context).primaryColor,
                          child: ListTile(
                            leading:const Icon(Icons.add_a_photo),
                            title: const Text("Camera"),
                            onTap: () {
                              getImage(ImageSource.camera);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                showDialog(context: context, builder: (_) => ad);
              },
            ),
          ),
        ],
      ),
    );
  }
}
