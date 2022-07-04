import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/property.dart';

Card buildCard(
        {required Property property, required Orientation orientation}) =>
    Card(
      elevation: 10,
      shadowColor: Colors.grey[200],
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: orientation==Orientation.landscape?200:150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: FileImage(File(property.image[0].modifiedPath),),
                    fit: BoxFit.fill),
                //   border: Border.all(color: Colors.blue, width: 10 ),
                borderRadius: BorderRadius.circular(10)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      property.price,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(width: 100,),
                    Text(
                      property.category,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                Text(
                  property.address!.country,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(height: 8,),
                Text(
                  property.address!.city,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
