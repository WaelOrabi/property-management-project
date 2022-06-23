import 'package:flutter/material.dart';
import 'package:project_111/features/properties/presentation/pages/map_screen.dart';
import '../widgets/add_property_widget/function_widjets.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {


  final governorateController = TextEditingController();
  final regionController = TextEditingController();
  final streetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                onPressed: () => showModalBottomSheet(
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return FractionallySizedBox(
                          heightFactor: 0.92,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  buildRowOfTextFormFieldSelectLocation(
                                    context: context,
                                    title: 'Governorate',
                                    controller: governorateController,
                                  ),
                                  buildRowOfTextFormFieldSelectLocation(
                                    context: context,
                                    title: 'Region',
                                    controller: regionController,
                                  ),
                                  buildRowOfTextFormFieldSelectLocation(
                                    context: context,
                                    title: 'Street',
                                    controller: streetController,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Text(
                                    'Add marker on the Map too',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 20,),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, MapScreen.routeName);
                                    } ,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                          color: Colors.green,
                                      ),
                                      margin:const EdgeInsets.all(16),
                                      height: 160,
                                      width: MediaQuery.of(context).size.width/2,
                                      child:const Icon(
                                            Icons.place,
                                            size: 100,
                                        color: Colors.white,
                                          )),

                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 5,
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.green,
                                      ),
                                      height: 50,
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: const Center(
                                        child: Text(
                                          "Save Location",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    onTap: () => Navigator.of(context).pop(),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      context: context,
                    ),
                child: const Text(
                  "Add location",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )))
      ],
    );
  }
}
