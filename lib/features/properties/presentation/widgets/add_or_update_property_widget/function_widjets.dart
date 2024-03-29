
import 'package:flutter/material.dart';
Container buildDescription(
    {
      required BuildContext context,
      required String title,
      required String errorValidator,
      required String hintText,
      required TextEditingController controller,

    }) {
  return Container(
    padding: const EdgeInsets.only(left: 15, top: 10),
    width: MediaQuery.of(context).size.width,
    height: 100,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextFormField(

          keyboardType: TextInputType.text,
          controller: controller,
          minLines: 2,
          maxLines: 2,
          validator: (value) {
            if (value!.length < 4) {
              return errorValidator;
            }
            return null;
          },
          style:  TextStyle(
              color: Theme.of(context).textTheme.bodyText2!.color),
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
              const EdgeInsets.only(left: 10, top: 11, right: 15),
              hintText: hintText),
        ),
      ],
    ),
  );
}



Row buildRowItemsOfCategory({
  required BuildContext context,
  required String titleItems,
  required double widthOfSizeBox,
  required String dropdownValue,
  required List<String> nameListItems,
  required FontWeight fontWeight,
  required Function fun,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        titleItems,
        style: TextStyle(fontSize: 20, fontWeight: fontWeight),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width / widthOfSizeBox,
        child: DropdownButton<String>(
          value: dropdownValue,
          iconSize: 20,
          style: const TextStyle(color: Colors.black, fontSize: 16),
          underline: Container(),
          onChanged:(data)=>fun(data),

          items: nameListItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    ],
  );
}



Row buildRowOfTextFormField(
    {
      required BuildContext context,
      required String title,
      required   TextEditingController controller,
      required double widthOfSizeBox,
      required FontWeight fontWeight}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: fontWeight,color: Theme.of(context).textTheme.bodyText2!.color),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width / widthOfSizeBox,
        child: TextFormField(
                keyboardType: TextInputType.number,
         controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter the $title";
            }
            return null;
          },
          style:  TextStyle(
              color: Theme.of(context).textTheme.bodyText2!.color),
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
              const EdgeInsets.only(left: 10, top: 11, right: 15),
              hintText: 'Enter the $title'),
        ),
      ),
    ],
  );
}







