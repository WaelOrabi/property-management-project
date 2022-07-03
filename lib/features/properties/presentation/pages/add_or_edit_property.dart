import 'package:advance_image_picker/models/image_object.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_111/core/widgets/property.dart';
import 'package:project_111/features/properties/presentation/pages/map_screen.dart';
import 'package:project_111/features/properties/presentation/pages/home_screen.dart';
import 'package:project_111/features/properties/presentation/widgets/add_property_widget/add_photo_advance_image.dart';
import '../../../../core/widgets/address.dart';
import '../../../../core/widgets/widget_appbar.dart';
import '../widgets/add_property_widget/function_widjets.dart';

class AddOrEditProperty extends StatefulWidget {
  AddOrEditProperty({Key? key, this.isEdit, this.property, this.address})
      : super(key: key);
  static String routeName = 'AddListing';

  final Property? property;
  bool? isEdit;

  late Address? address;
  List<ImageObject> imagesProperty = [];
  var dataAdded = DateFormat('yyyy-MM-dd hh:mm').format(DateTime.now());

  @override
  State<AddOrEditProperty> createState() => _AddOrEditPropertyState();
}

class _AddOrEditPropertyState extends State<AddOrEditProperty> {
  final formKey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final spaceController = TextEditingController();
  final storeysController = TextEditingController();
  final bedRoomController = TextEditingController();
  final bathsController = TextEditingController();
  String dropdownValueCategory = 'Buy';
  List<String> categoryItems = ['Rent', 'Buy', 'Investment'];

  @override
  Widget build(BuildContext context) {
    priceController.text = widget.isEdit == true ? widget.property!.price : '';
    storeysController.text =
        widget.isEdit == true ? widget.property!.storeys : '';
    spaceController.text = widget.isEdit == true ? widget.property!.space : '';
    descriptionController.text =
        widget.isEdit == true ? widget.property!.description : '';
    bedRoomController.text =
        widget.isEdit == true ? widget.property!.bedRooms : '';
    bathsController.text = widget.isEdit == true ? widget.property!.baths : '';

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: buildAppBar(
          namePage: widget.isEdit == true ? "Edit Property" : "Add Property",
          fun: () =>
              Navigator.pushReplacementNamed(context, HomeScreen.routeName),
          color: Colors.grey.shade200,
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
            //*****Description****//
            buildDescription(
              context: context,
              title: "Description",
              errorValidator: "please enter any description",
              hintText: "Write here..",
              controller: descriptionController,
            ),

            const SizedBox(height: 6),

            //*********//
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRowItemsOfCategory(
                      context: context,
                      titleItems: "Category",
                      fontWeight: FontWeight.bold,
                      widthOfSizeBox: 3.2,
                      dropdownValue: widget.isEdit == true
                          ? widget.property!.category
                          : dropdownValueCategory,
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
                  _buildAddOrEditPhotosText(),
                  AddPhotoAdvanceImage(
                    listImagesProperty: widget.isEdit == true
                        ? widget.imagesProperty + widget.property!.image
                        : widget.imagesProperty,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            containerBtnAddOrEdit()
          ],
        ),
      ),
    );
  }

  Container containerBtnAddOrEdit() {
    return Container(
      color: Colors.white,
      height: 60,
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.green),
          child: Center(
            child: Text(
              widget.isEdit == true ? "Edit Property" : "Add Property",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        onTap: () {
          Property pro = Property(
              address: widget.address,
              space: spaceController.text,
              baths: bathsController.text,
              bedRooms: bedRoomController.text,
              storeys: storeysController.text,
              dateAdded: widget.dataAdded,
              description: descriptionController.text,
              price: priceController.text,
              image: widget.imagesProperty,
              category: dropdownValueCategory);

          print(dropdownValueCategory);
          print("*********************");
          print("${pro.address!.city}\n,"
              "${pro.address!.country}\n,"
              "${pro.address!.region}\n,"
              "${pro.address!.latitude}\n,"
              "${pro.address!.longitude}\n,"
              "${pro.baths}\n,"
              "${pro.bedRooms}\n,"
              "${pro.space}\n,"
              "${pro.description}\n,"
              "${pro.dateAdded}");
          print("*********************");
        },
      ),
    );
  }

  Padding _buildAddOrEditPhotosText() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Text(
        widget.isEdit == true ? "Edit Photos" : "Add Photos",
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
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
                        address: widget.isEdit == true
                            ? widget.property!.address
                            : widget.address,
                      ),
                    ),
                  ).then((val) {
                    widget.address = val; //you get details from screen2 here
                  });
                },
                child: const Text(
                  "Add location",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )))
      ],
    );
  }
}
