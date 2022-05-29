import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_111/features/properties/presentation/pages/add_property/select_location.dart';
import 'package:project_111/features/properties/presentation/pages/home_screen/home_screen.dart';
import 'package:project_111/features/properties/presentation/widgets/add_property_widget/add_photo_advance_image.dart';
import '../../../../../core/widgets/widget_appbar.dart';
import '../../widgets/add_property_widget/filters.dart';
import '../../widgets/add_property_widget/function_widjets.dart';

class AddProperty extends StatefulWidget {
  const AddProperty({Key? key}) : super(key: key);
  static String routeName = 'AddListing';

  @override
  State<AddProperty> createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  final formKey = GlobalKey<FormState>();
final titleController = TextEditingController();
final descriptionController = TextEditingController();
final priceController = TextEditingController();

  String dropdownValueCategory = 'Buy';
  List<String> categoryItems = ['Rent', 'Buy','Investment'];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: WidgetsAppBar.buildAppBar(
          namePage: "Add Listing",
          fun: () =>Navigator.pushReplacementNamed(context, HomeScreen.routeName),
          color: Colors.grey.shade200,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                //****Title****//
                buildTitleAndDescription(
                  context: context,
                  title: "Title",
                  errorValidator: "please enter the title",
                  hintText: "Write the title",
                  controller: titleController,
                ),

                const SizedBox(height: 6),
                //*****Description****//
                buildTitleAndDescription(
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
                      buildRowOfTextFormFieldPrice(
                        context: context,
                        title: "price",
                        errorValidator: 'Enter the price',
                        hintText: 'Enter the price',
                        controller: priceController,
                        widthOfSizeBox: 3,
                        fontWeight: FontWeight.bold,
                      ),

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
                          }
                      ),

                      const Filters(),
                      const SelectLocation(),
                      //Add Images for property
                      const Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          "Add photos",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      const AddPhotoAdvanceImage(),
                    ],
                  ),
                ),

                const SizedBox(height: 6),

                // Bottom of Post Listing
                Container(
                  color: Colors.white,
                  height: 60,
                  child: GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green),
                      child: const Center(
                        child: Text(
                          "Post Listing",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );


  }



}
