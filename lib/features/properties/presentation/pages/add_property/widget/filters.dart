import 'package:flutter/material.dart';
import 'package:project_111/features/properties/presentation/pages/add_property/widget/function_widjets.dart';
import '../varibles_and_lists/varibles_and_lists.dart';
class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Filters",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width / 2.3,
            child: TextButton(
                onPressed: () => showModalBottomSheet(
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return FractionallySizedBox(
                      heightFactor: 0.9,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              buildRowItemsOfFilters(
                                  context: context,
                                  titleItems: "Rent or Buy",
                                  fontWeight: FontWeight.w500,
                                  widthOfSizeBox: 6.6,
                                  dropdownValue:
                                  dropdownValueRentOrBuy,
                                  nameListItems:
                                  rentOrBuyItems,
                                  fun: (data) {
                                    setState(() {
                                      dropdownValueRentOrBuy = data!;

                                    });
                                  }
                              ),

                              buildRowItemsOfFilters(
                                  context: context,
                                  titleItems: "Price Range",
                                  fontWeight:
                                  FontWeight.w500,
                                  widthOfSizeBox: 3.5,
                                  dropdownValue:
                                  dropdownValuePriceRange,
                                  nameListItems:
                                  priceRangeItems,
                                  fun: (data) {
                                    setState(() {
                                      dropdownValuePriceRange = data!;

                                    });
                                  }
                              ),

                              buildRowItemsOfFilters(
                                  context: context,
                                  titleItems: "Square Feet",
                                  fontWeight:
                                  FontWeight.w500,
                                  widthOfSizeBox: 2.5,
                                  dropdownValue:
                                  dropdownValueSquareFeet,
                                  nameListItems:
                                  squareFeetItems,
                                  fun: (data) {
                                    setState(() {
                                      dropdownValueSquareFeet = data!;

                                    });
                                  }
                              ),

                              buildRowItemsOfFilters(
                                  context: context,
                                  titleItems: "BedRooms",
                                  fontWeight:
                                  FontWeight.w500,
                                  widthOfSizeBox: 4.5,
                                  dropdownValue:
                                  dropdownValueBedRoom,
                                  nameListItems:
                                  bedRoomItems,
                                  fun: (data) {
                                    setState(() {
                                      dropdownValueBedRoom = data!;

                                    });
                                  }
                              ),

                              buildRowItemsOfFilters(
                                  context: context,
                                  titleItems: "Baths",
                                  fontWeight:
                                  FontWeight.w500,
                                  widthOfSizeBox: 4.5,
                                  dropdownValue:
                                  dropdownValueBaths,
                                  nameListItems: bathsItems,
                                  fun: (data) {
                                    setState(() {
                                      dropdownValueBaths = data!;

                                    });
                                  }
                              ),

                              buildRowItemsOfFilters(
                                  context: context,
                                  titleItems:
                                  "New Construction",
                                  fontWeight:
                                  FontWeight.w500,
                                  widthOfSizeBox: 8,
                                  dropdownValue:
                                  dropdownValueNewConstruction,
                                  nameListItems:
                                  newConstructionItems,
                                  fun: (data) {
                                    setState(() {
                                      dropdownValueNewConstruction = data!;

                                    });
                                  }
                              ),

                              buildRowOfTextFormFieldPriceAndYearBuilt(
                                context: context,
                                title: "Year Built",
                                errorValidator:
                                "Enter the year built ",
                                hintText:
                                "Enter the year built",
                                controller:
                                yearBuiltController,
                                widthOfSizeBox: 4,
                                fontWeight:
                                FontWeight.w500,

                              ),

                              buildRowItemsOfFilters(
                                  context: context,
                                  titleItems:
                                  "Close To Public Transport",
                                  fontWeight:
                                  FontWeight.w500,
                                  widthOfSizeBox: 8,
                                  dropdownValue:
                                  dropdownValueCloseToPublicTransport,
                                  nameListItems:
                                  closeToPublicTransportItems,
                                  fun: (data) {
                                    setState(() {
                                      dropdownValueCloseToPublicTransport = data!;
                                    });
                                  }
                              ),

                              SizedBox(height: MediaQuery.of(context).size.height / 7,),

                              GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.green ,
                                  ),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: const Center(
                                    child: Text(
                                      "Save Filters",
                                      style: TextStyle(
                                          color: Colors
                                              .white,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                                onTap: () =>
                                    Navigator.of(context)
                                        .pop(),
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
                  "Edit Filters",
                  style: TextStyle(
                      color: Colors.black, fontSize: 16),
                )))
      ],
    );
  }



}
