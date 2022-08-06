import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../../../../../core/paramaters.dart';
import '../../pages/add_or_update_property.dart';
import '../../pages/property_listing_details.dart';

class BuildCard extends StatefulWidget {
  final Property property;
  final Orientation orientation;
  final bool delete;

  const BuildCard(
      {Key? key,
      required this.property,
      required this.orientation,
      required this.delete}) : super(key: key);

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
          color: Colors.grey[200],

        child: Card(
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
                                var ad = alertDialog(context);
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
                          style: textStyle(context),
                        ),
                        const Spacer(),
                        Text(
                          property.category,
                          style: textStyle(context),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 8,
                    ),
 Row(
                      children: [
                        Text(
                          property.address.country + ',',
                          style: textStyle(context),
                        ),
                        Text(
                          property.address.city,
                          style: textStyle(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ));

  AlertDialog alertDialog(BuildContext context) {
    return AlertDialog(
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
                leading: Icon(
                  Icons.delete,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: const Text("Delete this property"),
                onTap: () => AwesomeDialog(
                  context: context,
                  animType: AnimType.SCALE,
                  dialogType: DialogType.QUESTION,
                  title: 'ِDelete',
                  desc: 'Do you want to delete this property?',
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
                  leading: Icon(
                    Icons.edit,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  title: const Text("Edit this property"),
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddOrUpdateProperty(
                                isUpdate: true,
                                property: widget.property,
                                address: widget.property.address,
                              )))),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle textStyle(BuildContext context) =>
      TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 16);
}
