import 'package:flutter/material.dart';
import '../../../../core/paramaters.dart';
import '../../../authentication/presentation/widgets/signin_signup/button_signin_signup_update.dart';
import 'list_property_search.dart';
import '../../../../tests/tests.dart';
import '../widgets/add_or_update_property_widget/function_widjets.dart';

class Search extends StatefulWidget {
  static String routeName = 'Search';

  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  double _startValuePrice = 10000000;
  double _endValuePrice = 1000000000000;
  double _startValueRoom = 1;
  double _endValueRoom = 20;
  double _startValueStoreys = 1;
  double _endValueStoreys = 20;
  double _startValueSpace = 50;
  double _endValueSpace = 1000;
  final ScrollController _scrollController = ScrollController();
  TextEditingController roomController = TextEditingController();
  TextEditingController storeyController = TextEditingController();
  List<String> propertyType = [
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
  String typeGovernorate = '';
  String typeProperty = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: OrientationBuilder(builder: (context, orientation) {
        return buildBody(context: context, orientation: orientation);
      }),
    );
  }

  SafeArea buildBody(
      {required BuildContext context, required Orientation orientation}) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: orientation == Orientation.landscape
                    ? MediaQuery.of(context).size.height / 6
                    : MediaQuery.of(context).size.height / 16,
                child: ListView.separated(
                  itemCount: propertyType.length,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              typeProperty = propertyType[index];
                            });
                          },
                          child: Card(
                            child: SizedBox(
                                width: orientation == Orientation.landscape
                                    ? MediaQuery.of(context).size.width / 4
                                    : MediaQuery.of(context).size.width / 3,
                                child: Center(
                                    child: Text(
                                  propertyType[index],
                                  style: TextStyle(
                                      color: propertyType[index] == typeProperty
                                          ? Colors.white
                                          : Colors.green),
                                ))),
                            color: propertyType[index] == typeProperty
                                ? Colors.green
                                : Theme.of(context).cardTheme.color,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: orientation == Orientation.landscape
                          ? MediaQuery.of(context).size.width / 15
                          : MediaQuery.of(context).size.width / 24,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: orientation == Orientation.landscape
                    ? MediaQuery.of(context).size.height / 1.4
                    : MediaQuery.of(context).size.height / 4,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: GridView.count(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    crossAxisCount: 2,
                    childAspectRatio:
                        orientation == Orientation.landscape ? 0.3 : 0.5,
                    primary: false,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: governorate.map((governorate) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            typeGovernorate = governorate;
                          });
                        },
                        child: Card(
                          color: typeGovernorate == governorate
                              ? Colors.green
                              : Theme.of(context).cardTheme.color,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: orientation == Orientation.landscape
                                    ? MediaQuery.of(context).size.width / 3
                                    : MediaQuery.of(context).size.width / 5,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/$governorate.jpg'),
                                        fit: BoxFit.fill),
                                    //   border: Border.all(color: Colors.blue, width: 10 ),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                governorate,
                                style: TextStyle(
                                    color: typeGovernorate == governorate
                                        ? Colors.white
                                        : Colors.green),
                              ),
                            ],
                          ),
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
              buildRangeSlider(
                min: 10000000,
                max: 1000000000000,
                startValue: _startValuePrice,
                endValue: _endValuePrice,
                fun: (values) {
                  setState(() {
                    _startValuePrice = values.start;
                    _endValuePrice = values.end;
                  });
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Room',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              buildRangeSlider(
                  min: 1,
                  max: 20,
                  startValue: _startValueRoom,
                  endValue: _endValueRoom,
                  fun: (values) {
                    setState(() {
                      _startValueRoom = values.start;
                      _endValueRoom = values.end;
                    });
                  }),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Storeys',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              buildRangeSlider(
                min: 1,
                max: 20,
                startValue: _startValueStoreys,
                endValue: _endValueStoreys,
                fun: (values) {
                  setState(() {
                    _startValueStoreys = values.start;
                    _endValueStoreys = values.end;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    'Space',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' (meter)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              buildRangeSlider(
                min: 50,
                max: 1000,
                startValue: _startValueSpace,
                endValue: _endValueSpace,
                fun: (values) {
                  setState(() {
                    _startValueSpace = values.start;
                    _endValueSpace = values.end;
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
                  width: orientation == Orientation.landscape ? 3.5 : 2.0,
                  circle: 50,
                  text: 'Search',
                  fun: () {
                    SearchParameters(
                        typeProperty: typeProperty,
                        typeGovernorate: typeGovernorate,
                        price: [_startValuePrice, _endValuePrice],
                        room: roomController.text,
                        space: [_startValueSpace, _endValueSpace],
                        storey: storeyController.text);

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ListPropertySearch(
                            listPropertySearch: Te.listPropertySearch)));
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  RangeSlider buildRangeSlider(
      {required double min,
      required double max,
      required double startValue,
      required double endValue,
      required Function(RangeValues) fun}) {
    return RangeSlider(
      min: min,
      activeColor: Colors.green,
      max: max,
      divisions: 10,
      labels: RangeLabels(
        startValue.round().toString(),
        endValue.round().toString(),
      ),
      values: RangeValues(startValue, endValue),
      onChanged: fun,
    );
  }
}
