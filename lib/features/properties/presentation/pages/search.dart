import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_111/features/authentication/presentation/widgets/signin_signup/button_signin_signup_update.dart';
import 'package:project_111/features/properties/presentation/pages/list_property_search.dart';

import '../../../../tests/tests.dart';
import '../widgets/add_or_update_property_widget/function_widjets.dart';

class Search extends StatefulWidget {
  static String routeName = 'Search';

  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  double _startValue = 10000000;
  double _endValue = 1000000000000;
  ScrollController _scrollController = ScrollController();
  TextEditingController roomController = TextEditingController();
  TextEditingController storeyController = TextEditingController();
  List<String> property_type = [
    'Sale',
    'Rent',
    'Investment',
  ];
  List<String> governorate = [
    'Damascus',
    'Allepo',
    'Homs',
    'Latakia',
    'Hama',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                      child: ListView.builder(
                        itemCount: property_type.length,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Card(
                                  child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      child: Center(
                                          child: Text(
                                        property_type[index],
                                        style: TextStyle(
                                            color:
                                                property_type[index] == "Rent"
                                                    ? Colors.white
                                                    : Colors.green),
                                      ))),
                                  color: property_type[index] == "Rent"
                                      ? Colors.green
                                      : Colors.white,
                                  shadowColor: Colors.grey,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      width: double.infinity,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: GridView.count(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          controller: _scrollController,
                          crossAxisCount: 2,
                          childAspectRatio: 0.5,
                          primary: false,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: governorate.map((governorate) {
                            return GestureDetector(
                              onTap: () {
                                print('hello');
                              },
                              child: Card(
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 80,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/$governorate.jpg'),
                                              fit: BoxFit.fill),
                                          //   border: Border.all(color: Colors.blue, width: 10 ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      governorate,
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ],
                                ),
                                shadowColor: Colors.grey,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Price',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RangeSlider(
                      min: 10000000,
                      max: 1000000000000,
                      divisions: 10,
                      labels: RangeLabels(
                        _startValue.round().toString(),
                        _endValue.round().toString(),
                      ),
                      values: RangeValues(_startValue, _endValue),
                      onChanged: (values) {
                        setState(() {
                          _startValue = values.start;
                          _endValue = values.end;
                        });
                      },
                    ),
                    buildRowOfTextFormField(
                        context: context,
                        title: "Room",
                        controller: roomController,
                        widthOfSizeBox: 2,
                        fontWeight: FontWeight.bold),
                    buildRowOfTextFormField(
                        context: context,
                        title: "Storeys",
                        controller: storeyController,
                        widthOfSizeBox: 2,
                        fontWeight: FontWeight.bold),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Space',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RangeSlider(
                      min: 10000000,
                      max: 1000000000000,
                      divisions: 10,
                      labels: RangeLabels(
                        _startValue.round().toString(),
                        _endValue.round().toString(),
                      ),
                      values: RangeValues(_startValue, _endValue),
                      onChanged: (values) {
                        setState(() {
                          _startValue = values.start;
                          _endValue = values.end;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ButtonSigninSignupProfile(
                          context: context,
                          height: 40,
                          width: 1.5,
                          circle: 50,
                          text: 'Search',
                          fun: () {
                            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ListPropertySearch(listPropertySearch:Te.listPropertySearch)));
                          },
                          fontWeight: FontWeight.bold,
                          colorText: Colors.white,
                          backGroundColor: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
