
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
final yearBuiltController = TextEditingController();
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



Row buildRowOfTextFormFieldPrice(
    {required BuildContext context,
      required String title,
      required String errorValidator,
      required String hintText,
      required TextEditingController controller,
      required double widthOfSizeBox,
      required FontWeight fontWeight}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: fontWeight),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width / widthOfSizeBox,
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return errorValidator;
            }
            return null;
          },
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
      ),
    ],
  );
}




Row buildRowOfTextFormFieldPriceAndYearBuilt(
   {required BuildContext context,
      required String title,
      required String errorValidator,
      required String hintText,
      required TextEditingController controller,
      required double widthOfSizeBox,
      required FontWeight fontWeight,
   //  required VoidCallback fun({required String textEditingController,required String formdate})

   }) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: fontWeight),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width / widthOfSizeBox,
        child:TextFormField(
          keyboardType: TextInputType.datetime,
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return errorValidator;
            }
            return null;
          },
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
              const EdgeInsets.only(left: 10, top: 11, right: 15),
              hintText: hintText),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                builder:(BuildContext context, Widget? child) {
                    return buildThemeDatePicker(context, child!);
                  },
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2021),
                  //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2023));

              if (pickedDate != null) {
                String formattedDate =
                DateFormat('yyyy-MM-dd').format(pickedDate);
yearBuiltController.text=formattedDate;
              }
            },

        ),
      ),
    ],
  );
}

Theme buildThemeDatePicker(BuildContext context, Widget child) {
  return Theme(
    data: ThemeData.light().copyWith(
      primaryColor:
      Theme.of(context).accentColor,
      accentColor:
      Theme.of(context).primaryColor,
      colorScheme: ColorScheme.light(
          primary:
          Theme.of(context).accentColor),
      buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary),
    ),
    child: child,
  );
}



Row buildRowOfTextFormFieldSelectLocation(
    {required BuildContext context,
      required String title,
      required TextEditingController controller,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style:const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter the $title';
            }
            return null;
          },
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



Row buildRowItemsOfFilters({
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
      DropdownButton<String>(
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
    ],
  );
}




Container buildTitleAndDescription(
    {required BuildContext context,
      required String title,
      required String errorValidator,
      required String hintText,
      required TextEditingController controller}) {
  return Container(
    padding: const EdgeInsets.only(left: 15, top: 10),
    color: Colors.white,
    width: MediaQuery.of(context).size.width,
    height: 90,
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
          validator: (value) {
            if (value!.length < 4) {
              return errorValidator;
            }
            return null;
          },
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