import 'package:advance_image_picker/models/image_object.dart';
import 'package:flutter/material.dart';

final formKey = GlobalKey<FormState>();
final titleController = TextEditingController();
final descriptionController = TextEditingController();
final priceController = TextEditingController();
final yearBuiltController = TextEditingController();
final governorateController = TextEditingController();
final regionController = TextEditingController();
final streetController = TextEditingController();

List<ImageObject> imgObjs = [];

String dropdownValueCategory = 'Houses';
String dropdownValuePriceRange = '<\$100K';
String dropdownValueSquareFeet = '<100sqft';
String dropdownValueRentOrBuy = 'Buy';
String dropdownValueBedRoom = 'notFound';
String dropdownValueBaths = 'notFound';
String dropdownValueNewConstruction = 'No';
String dropdownValueCloseToPublicTransport = 'No';

List<String> rentOrBuyItems = ['Rent', 'Buy'];
List<String> closeToPublicTransportItems = ['Yes', 'No'];
List<String> newConstructionItems = ['Yes', 'No'];
List<String> squareFeetItems = [
  '<100sqft',
  '100sqft - 500sqft',
  '500sqft - 1000sqft',
  '1000sqft - 2000sqft',
  '>2000sqft',
];
List<String> priceRangeItems = [
  '<\$100K',
  '\$100K-\$500k',
  '\$500K-\$1M',
  '\$1M-\$5M',
  '>\$5M',
];
List<String> bedRoomItems = [
  'notFound',
  '1bd',
  '2bd',
  '3bd',
  '4bd',
  '>4bd',
];
List<String> bathsItems = [
  'notFound',
  '1ba',
  '2ba',
  '3ba',
  '4ba',
  '>4ba',
];


List<String> categoryItems = [
  'Houses',
  'Apartment',
  'Condos',
  'Land',
  'Buildings',
  'Town Houses',
  'Recently Sold'
];
