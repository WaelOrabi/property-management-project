import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/property.dart';
import 'package:project_111/features/properties/presentation/pages/add_or_update_property.dart';
import 'package:project_111/features/properties/presentation/pages/property_listing_details.dart';

class BuildCard extends StatefulWidget {
  final Property property;
  final Orientation orientation;
  final bool delete;

  const BuildCard(
      {Key? key,
      required this.property,
      required this.orientation,
      required this.delete})
      : super(key: key);

  @override
  State<BuildCard> createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  @override
  Widget build(BuildContext context) {
    return widgetBuildCard(
        property: widget.property,
        orientation: widget.orientation,
        context: context,
        delete: widget.delete);
  }

  InkWell widgetBuildCard(
          {required Property property,
          required Orientation orientation,
          required BuildContext context,
          required bool delete}) =>
      InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  PropertyListingDetails(property: property)));
        },
        child: Container(
          //elevation: 10,
         // shadowColor: Colors.grey[200],
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: orientation == Orientation.landscape ? 180 : 145,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(
                              File(property.image[0].modifiedPath),
                            ),
                            fit: BoxFit.fill),
                        //   border: Border.all(color: Colors.blue, width: 10 ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  delete == true
                      ? Positioned(
                          left: 8,
                          child: IconButton(
                              onPressed: () {
                                var ad = AlertDialog(
                                  title: const Text("Do you want to :"),
                                  content: SizedBox(
                                    height: 150,
                                    child: Column(
                                      children: [
                                        const Divider(
                                          height: 10,
                                        ),
                                        Container(
                                          color: Colors.red,
                                          child: ListTile(
                                            leading: const Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                            ),
                                            title: const Text(
                                                "Delete this property"),
                                            onTap: () => AwesomeDialog(
                                              context: context,
                                              animType: AnimType.SCALE,
                                              dialogType: DialogType.QUESTION,
                                              title: 'ِDelete',
                                              desc:
                                                  'Do you want to delete this property?',
                                              btnOkOnPress: () {
                                                setState(() {
                                                  Navigator.of(context).pop();
                                                });
                                              },
                                            )..show(),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          color: Colors.green,
                                          child: ListTile(
                                              leading: const Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                              ),
                                              title: const Text(
                                                  "Edit this property"),
                                              onTap: () =>
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              AddOrUpdateProperty(
                                                                isUpdate: true,
                                                                property:widget.property,
                                                                address: widget.property.address,
                                                              )))),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                                showDialog(
                                    context: context, builder: (_) => ad);
                              },
                              icon: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              )))
                      : const Text(''),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 4,right: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          property.price,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          property.category,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          property.address.country + ',',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          property.address.city,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
