import 'package:flutter/material.dart';
import '../../pages/element_category.dart';

Widget buildCategory({
  required BuildContext context,
  required String linkImage,
  required String nameBtn,
  required double height,
  required double width,
  required VoidCallback fun,
}) {
  return GestureDetector(
    child: Container(
      height: MediaQuery.of(context).size.height / height,
      width: MediaQuery.of(context).size.width / width,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(linkImage),
            fit: BoxFit.cover,
            colorFilter:
                const ColorFilter.mode(Colors.grey, BlendMode.modulate),
          ),

          borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Text(nameBtn,style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)),

    ),
    onTap: fun,
  );
}

Widget buildCategories(BuildContext context, Orientation orientation) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        buildCategory(
          context: context,
          linkImage: "assets/images/buy.jpg",
          nameBtn: "Sale",
          fun: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ElementCategory(
                          category: 'Sale',
                        )));
          },
          height: orientation == Orientation.landscape ? 3 : 6,
          width: orientation == Orientation.landscape ? 2.8 : 2.3,
        ),
        const SizedBox(
          width: 6,
        ),
        buildCategory(
          context: context,
          linkImage: "assets/images/rent.jpg",
          nameBtn: "Rent",
          fun: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ElementCategory(
                          category: 'Rent',
                        )));
          },
          height: orientation == Orientation.landscape ? 3 : 6,
          width: orientation == Orientation.landscape ? 2.8 : 2.3,
        ),
        const SizedBox(
          width: 6,
        ),
        buildCategory(
          context: context,
          linkImage: "assets/images/Investment.jpg",
          nameBtn: "Investment",
          fun: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ElementCategory(
                          category: 'Investment',
                        )));
          },
          height: orientation == Orientation.landscape ? 3 : 6,
          width: orientation == Orientation.landscape ? 2.8 : 2.3,
        ),
      ],
    ),
  );
}
