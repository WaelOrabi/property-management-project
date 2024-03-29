import 'package:advance_image_picker/models/image_object.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../../../core/widgets/widget_appbar.dart';
import '../../domain/entities/address.dart';
import '../../domain/entities/property.dart';
import '../widgets/add_or_update_property_widget/add_photo_advance_image.dart';
import '../widgets/add_or_update_property_widget/build_add_or_edit_photos_text.dart';
import '../widgets/add_or_update_property_widget/function_widjets.dart';
import '../widgets/add_or_update_property_widget/widget_btn_Add_or_edit.dart';
import 'map_screen.dart';

// ignore: must_be_immutable
class AddOrUpdateProperty extends StatefulWidget {
  AddOrUpdateProperty({Key? key, this.isUpdate, this.property, this.address})
      : super(key: key);
  static String routeName = 'AddListing';

  final Property? property;
  bool? isUpdate;

  late Address? address;
  List<ImageObject> imagesProperty = [];
  var dataAdded = DateFormat('yyyy-MM-dd hh:mm').format(DateTime.now());

  @override
  State<AddOrUpdateProperty> createState() => _AddOrUpdatePropertyState();
}

class _AddOrUpdatePropertyState extends State<AddOrUpdateProperty> {
  final formKey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final spaceController = TextEditingController();
  final storeysController = TextEditingController();
  final bedRoomController = TextEditingController();
  final bathsController = TextEditingController();
  String dropdownValueCategory = 'Sale';
  List<String> categoryItems = ['Rent', 'Sale', 'Investment'];

  @override
  void initState() {
    if (widget.isUpdate == true) {
      priceController.text = widget.property!.price;
      storeysController.text = widget.property!.storeys;
      spaceController.text = widget.property!.space;
      descriptionController.text = widget.property!.description;
      bedRoomController.text = widget.property!.bedRooms;
      bathsController.text = widget.property!.baths;
      widget.imagesProperty.addAll(widget.property!.image);
      widget.address = widget.property!.address;
      dropdownValueCategory = widget.property!.category;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Theme.of(context).backgroundColor,
        appBar: buildAppBar(
          namePage:
              widget.isUpdate == true ? "Update Property" : "Add Property",
          fun: () => Navigator.pushReplacementNamed(
              context, NavigationBarHome.routeName),

        ),
        body: _buildBody(context),
      ),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            buildDescription(
              context: context,
              title: "Description",
              errorValidator: "please enter any description",
              hintText: "Write here..",
              controller: descriptionController,
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRowItemsOfCategory(
                      context: context,
                      titleItems: "Category",
                      fontWeight: FontWeight.bold,
                      widthOfSizeBox: 3.2,
                      dropdownValue: dropdownValueCategory,
                      nameListItems: categoryItems,
                      fun: (data) {
                        setState(() {
                          dropdownValueCategory = data!;
                        });
                      }),
                  buildRowOfTextFormField(
                    context: context,
                    title: "price",
                    controller: priceController,
                    widthOfSizeBox: 3,
                    fontWeight: FontWeight.bold,
                  ),
                  buildRowOfTextFormField(
                    context: context,
                    title: "Space",
                    controller: spaceController,
                    widthOfSizeBox: 3,
                    fontWeight: FontWeight.bold,
                  ),
                  buildRowOfTextFormField(
                    context: context,
                    title: "Storeys",
                    controller: storeysController,
                    widthOfSizeBox: 3,
                    fontWeight: FontWeight.bold,
                  ),
                  buildRowOfTextFormField(
                    context: context,
                    title: "Bed Room",
                    controller: bedRoomController,
                    widthOfSizeBox: 3,
                    fontWeight: FontWeight.bold,
                  ),
                  buildRowOfTextFormField(
                    context: context,
                    title: "Baths",
                    controller: bathsController,
                    widthOfSizeBox: 3,
                    fontWeight: FontWeight.bold,
                  ),
                  rowAddLocation(context),
                  buildAddOrUpdatePhotosText(
                      isUpdate: widget.isUpdate == true ? true : false),
                  AddPhotoAdvanceImage(
                      listImagesProperty: widget.imagesProperty),
                ],
              ),
            ),
            const SizedBox(height: 6),
            widgetBtnAddOrUpdate(
              isUpdate: widget.isUpdate == true ? true : false,
              fun: () {
                Property pro = Property(
                  propertyId: 1,
                    address: widget.address!,
                    space: spaceController.text,
                    baths: bathsController.text,
                    bedRooms: bedRoomController.text,
                    storeys: storeysController.text,
                    dateAdded: widget.dataAdded,
                    description: descriptionController.text,
                    price: priceController.text,
                    image: widget.imagesProperty,
                    category: dropdownValueCategory);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigationBarHome(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Row rowAddLocation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Location",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width / 2.3,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapScreen(
                        address: widget.address,
                      ),
                    ),
                  ).then((val) {
                    widget.address = val; //you get details from screen2 here
                  });
                },

                child:  Text(
                widget.isUpdate==true?"Update location"  :"Add location",
                  style:const TextStyle(color: Colors.black, fontSize: 16),


                ))),
        const SizedBox(height: 20,)
      ],
    );
  }
}
