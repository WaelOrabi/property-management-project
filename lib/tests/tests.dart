import 'dart:io';
import 'package:advance_image_picker/advance_image_picker.dart';
import 'package:project_111/core/paramaters.dart';
class Te {
  static List<NotificationParametersMessage> notificationMessage =[
    NotificationParametersMessage(
        firstName: 'abd',
        lastName: 'Al Karaem',
        image: File('/storage/emulated/0/Download/images (16).jpeg'),
        idProperty: 1,
        message: 'hi wael'),
    NotificationParametersMessage(
        firstName: 'abd',
        lastName: 'Al Karaem',
        image: File('/storage/emulated/0/Download/images (16).jpeg'),
        idProperty: 3,
        message: 'hi wael'),
  ];
  static User user = User(
    isAdmin: true,
    isSuperAdmin: true,
    id: 1,
    firstName: 'Ayham',
    lastName: 'Alrefay',
    email: 'ayhamalrefay@gmail.com',
    phoneNumber: '0933773538',
    messages: [
      'hi ayham',
      'hi ayham',
      'hi ayham',
      'hi ayham',
    ],
    image: File('/storage/emulated/0/Download/images (17).jpeg'),
    listProperty: [
      Property(
          idProperty: 2,
          address: Address(
            latitude: 33.51689336744682,
            longitude: 36.26502357423305,
            region: 'Al Mouhajrin',
            city: ' Damascus ',
            country: 'Syria',
          ),
          space: '34',
          baths: '65',
          bedRooms: '54',
          storeys: '445',
          dateAdded: '2021-11-11',
          description: 'description111222',
          price: '56',
          image: [
            ImageObject(
                originalPath: '/storage/emulated/0/Download/images (15).jpeg',
                modifiedPath: '/storage/emulated/0/Download/images (15).jpeg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Download/images (14).jpeg',
                modifiedPath: '/storage/emulated/0/Download/images (14).jpeg'),
          ],
          category: 'Sale'),
      Property(
          idProperty: 2,
          address: Address(
            latitude: 33.51689336744682,
            longitude: 36.26502357423305,
            region: 'Al Mouhajrin',
            city: ' Damascus ',
            country: 'Syria',
          ),
          space: '34',
          baths: '65',
          bedRooms: '54',
          storeys: '445',
          dateAdded: '2021-11-11',
          description: 'description111222',
          price: '56',
          image: [
            ImageObject(
                originalPath: '/storage/emulated/0/Download/images (13).jpeg',
                modifiedPath: '/storage/emulated/0/Download/images (13).jpeg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Download/images (12).jpeg',
                modifiedPath: '/storage/emulated/0/Download/images (12).jpeg'),
          ],
          category: 'Buy'),
      Property(
          idProperty: 2,
          address: Address(
            latitude: 33.51689336744682,
            longitude: 36.26502357423305,
            region: 'Al Mouhajrin',
            city: ' Damascus ',
            country: 'Syria',
          ),
          space: '34',
          baths: '65',
          bedRooms: '54',
          storeys: '445',
          dateAdded: '2021-11-11',
          description: 'description111222',
          price: '56',
          image: [
            ImageObject(
                originalPath: '/storage/emulated/0/Download/images (11).jpeg',
                modifiedPath: '/storage/emulated/0/Download/images (11).jpeg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Download/images (10).jpeg',
                modifiedPath: '/storage/emulated/0/Download/images (10).jpeg'),
          ],
          category: 'Rent'),
      Property(
          idProperty: 2,
          address: Address(
            latitude: 33.51689336744682,
            longitude: 36.26502357423305,
            region: 'Al Mouhajrin',
            city: ' Damascus ',
            country: 'Syria',
          ),
          space: '34',
          baths: '65',
          bedRooms: '54',
          storeys: '445',
          dateAdded: '2021-11-11',
          description: 'description111222',
          price: '56',
          image: [
            ImageObject(
                originalPath: '/storage/emulated/0/Download/images (9).jpeg',
                modifiedPath: '/storage/emulated/0/Download/images (9).jpeg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Download/images (8).jpeg',
                modifiedPath: '/storage/emulated/0/Download/images (8).jpeg'),
          ],
          category: 'Sale'),
    ],
    listPropertyFavorite: [
      Property(
          idProperty: 2,
          address: Address(
            latitude: 33.51689336744682,
            longitude: 36.26502357423305,
            region: 'Al Mouhajrin',
            city: ' Damascus ',
            country: 'Syria',
          ),
          space: '34',
          baths: '65',
          bedRooms: '54',
          storeys: '445',
          dateAdded: '2021-11-11',
          description: 'description111222',
          price: '56',
          image: [
            ImageObject(
                originalPath: '/storage/emulated/0/Download/images (7).jpeg',
                modifiedPath: '/storage/emulated/0/Download/images (7).jpeg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Download/images (6).jpeg',
                modifiedPath: '/storage/emulated/0/Download/images (6).jpeg'),
          ],
          category: 'Rent'),
      Property(
          idProperty: 2,
          address: Address(
            latitude: 33.51689336744682,
            longitude: 36.26502357423305,
            region: 'Al Mouhajrin',
            city: ' Damascus ',
            country: 'Syria',
          ),
          space: '34',
          baths: '65',
          bedRooms: '54',
          storeys: '445',
          dateAdded: '2021-11-11',
          description: 'description111222',
          price: '56',
          image: [
            ImageObject(
                originalPath: '/storage/emulated/0/Download/images (5).jpeg',
                modifiedPath: '/storage/emulated/0/Download/images (5).jpeg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Download/images (4).jpeg',
                modifiedPath: '/storage/emulated/0/Download/images (4).jpeg'),
          ],
          category: 'Rent'),
      Property(
          idProperty: 2,
          address: Address(
            latitude: 33.51689336744682,
            longitude: 36.26502357423305,
            region: 'Al Mouhajrin',
            city: ' Damascus ',
            country: 'Syria',
          ),
          space: '34',
          baths: '65',
          bedRooms: '54',
          storeys: '445',
          dateAdded: '2021-11-11',
          description: 'description111222',
          price: '56',
          image: [
            ImageObject(
                originalPath: '/storage/emulated/0/Download/images (3).jpeg',
                modifiedPath: '/storage/emulated/0/Download/images (3).jpeg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Download/images (2).jpeg',
                modifiedPath: '/storage/emulated/0/Download/images (2).jpeg'),
          ],
          category: 'Sale'),
      Property(
          idProperty: 2,
          address: Address(
            latitude: 33.51689336744682,
            longitude: 36.26502357423305,
            region: 'Al Mouhajrin',
            city: ' Damascus ',
            country: 'Syria',
          ),
          space: '34',
          baths: '65',
          bedRooms: '54',
          storeys: '445',
          dateAdded: '2021-11-11',
          description: 'description111222',
          price: '56',
          image: [
            ImageObject(
                originalPath: '/storage/emulated/0/Download/images (9).jpeg',
                modifiedPath: '/storage/emulated/0/Download/images (9).jpeg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Download/images (8).jpeg',
                modifiedPath: '/storage/emulated/0/Download/images (8).jpeg'),
          ],
          category: 'Buy'),
    ],
    address: Address(
      latitude: 33.50426786925087,
      longitude: 36.31582662463188,
      region: 'Al Shaghour',
      city: 'Damascus ',
      country: 'Syria',
    ),
  );

  static List<Property> listPropertySearch = [
    Property(
        idProperty: 2,
        address: Address(
          latitude: 33.51689336744682,
          longitude: 36.26502357423305,
          region: 'Al Mouhajrin',
          city: ' Damascus ',
          country: 'Syria',
        ),
        space: '34',
        baths: '65',
        bedRooms: '54',
        storeys: '445',
        dateAdded: '2021-11-11',
        description: 'description111222',
        price: '56',
        image: [
          ImageObject(
              originalPath: '/storage/emulated/0/Download/3120-4b0b24b28d17da4d2c46cb9d562043cc.jpg',
              modifiedPath: '/storage/emulated/0/Download/3120-4b0b24b28d17da4d2c46cb9d562043cc.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Download/dalaman_villa_1.jpg',
              modifiedPath: '/storage/emulated/0/Download/dalaman_villa_1.jpg'),
        ],
        category: 'Buy'),
    Property(
        idProperty: 2,
        address: Address(
          latitude: 33.51689336744682,
          longitude: 36.26502357423305,
          region: 'Al Mouhajrin',
          city: ' Damascus ',
          country: 'Syria',
        ),
        space: '34',
        baths: '65',
        bedRooms: '54',
        storeys: '445',
        dateAdded: '2021-11-11',
        description: 'description111222',
        price: '56',
        image: [
          ImageObject(
              originalPath: '/storage/emulated/0/Download/2357-5.jpg',
              modifiedPath: '/storage/emulated/0/Download/2357-5.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Download/2357-8.jpg',
              modifiedPath: '/storage/emulated/0/Download/2357-8.jpg'),
        ],
        category: 'Buy'),
    Property(
        idProperty: 2,
        address: Address(
          latitude: 33.51689336744682,
          longitude: 36.26502357423305,
          region: 'Al Mouhajrin',
          city: ' Damascus ',
          country: 'Syria',
        ),
        space: '34',
        baths: '65',
        bedRooms: '54',
        storeys: '445',
        dateAdded: '2021-11-11',
        description: 'description111222',
        price: '56',
        image: [
          ImageObject(
              originalPath: '/storage/emulated/0/Download/2357-6.jpg',
              modifiedPath: '/storage/emulated/0/Download/2357-6.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Download/sarigerme_beach_property_1.jpg',
              modifiedPath: '/storage/emulated/0/Download/sarigerme_beach_property_1.jpg'),
        ],
        category: 'Buy'),
    Property(
        idProperty: 2,
        address: Address(
          latitude: 33.51689336744682,
          longitude: 36.26502357423305,
          region: 'Al Mouhajrin',
          city: ' Damascus ',
          country: 'Syria',
        ),
        space: '34',
        baths: '65',
        bedRooms: '54',
        storeys: '445',
        dateAdded: '2021-11-11',
        description: 'description111222',
        price: '56',
        image: [
          ImageObject(
              originalPath: '/storage/emulated/0/Download/dalaman_property_for_sale_1.jpg',
              modifiedPath: '/storage/emulated/0/Download/dalaman_property_for_sale_1.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Download/2357-5.jpg',
              modifiedPath: '/storage/emulated/0/Download/2357-5.jpg'),
        ],
        category: 'Buy'),
  ];
  static List<Property> listProperty1 = [
    Property(
        idProperty: 2,
        address: Address(
          latitude: 33.51689336744682,
          longitude: 36.26502357423305,
          region: 'Al Mouhajrin',
          city: ' Damascus ',
          country: 'Syria',
        ),
        space: '34',
        baths: '65',
        bedRooms: '54',
        storeys: '445',
        dateAdded: '2021-11-11',
        description: 'there is here description',
        price: '56',
        image: [
          ImageObject(
              originalPath: '/storage/emulated/0/Download/images (9).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (9).jpeg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Download/images (8).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (8).jpeg'),
        ],
        category: 'Rent'),
    Property(
        idProperty: 2,
        address: Address(
          latitude: 33.51689336744682,
          longitude: 36.26502357423305,
          region: 'Al Mouhajrin',
          city: ' Homs',
          country: 'Syria',
        ),
        space: '344',
        baths: '6',
        bedRooms: '5',
        storeys: '445',
        dateAdded: '2021-12-11',
        description: 'description111222',
        price: '56',
        image: [
          ImageObject(
              originalPath: '/storage/emulated/0/Download/images (7).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (7).jpeg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Download/images (6).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (6).jpeg'),
        ],
        category: 'Sale'),
    Property(
        idProperty: 2,
        address: Address(
          latitude: 33.51689336744682,
          longitude: 36.26502357423305,
          region: 'Al Mouhajrin',
          city: 'Alepo',
          country: 'Syria',
        ),
        space: '34',
        baths: '65',
        bedRooms: '54',
        storeys: '445',
        dateAdded: '2021-11-11',
        description: 'dsdfdsfescription111222',
        price: '56',
        image: [
          ImageObject(
              originalPath: '/storage/emulated/0/Download/images (3).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (3).jpeg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Download/images (2).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (2).jpeg'),
        ],
        category: 'Sale'),
    Property(
        idProperty: 2,
        address: Address(
          latitude: 33.51689336744682,
          longitude: 36.26502357423305,
          region: 'Al Mouhajrin',
          city: ' Hama ',
          country: 'Syria',
        ),
        space: '34',
        baths: '65',
        bedRooms: '54',
        storeys: '445',
        dateAdded: '2021-11-11',
        description: 'description111222',
        price: '56',
        image: [
          ImageObject(
              originalPath: '/storage/emulated/0/Download/images (5).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (5).jpeg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Download/images (4).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (4).jpeg'),
        ],
        category: 'Sale'),
  ];

  static List<User> listUser1 = [
    User(
      isAdmin: true,
      isSuperAdmin: true,
      id: 1,
      firstName: 'Ayham',
      lastName: 'Alrefay',
      email: 'ayhamalrefay@gmail.com',
      phoneNumber: '0933773538',
      messages: [
        'hi ayham',
        'hi ayham',
        'hi ayham',
        'hi ayham',
      ],
      sendTime: '02:15',
      image: File('/storage/emulated/0/Download/images (17).jpeg'),
      listProperty: [
        Property(
            idProperty: 2,
            address: Address(
              latitude: 33.51689336744682,
              longitude: 36.26502357423305,
              region: 'Al Mouhajrin',
              city: ' Damascus ',
              country: 'Syria',
            ),
            space: '34',
            baths: '65',
            bedRooms: '54',
            storeys: '445',
            dateAdded: '2021-11-11',
            description: 'there is here description',
            price: '56',
            image: [
              ImageObject(
                  originalPath: '/storage/emulated/0/Download/images (9).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (9).jpeg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Download/images (8).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (8).jpeg'),
            ],
            category: 'Rent'),
        Property(
            idProperty: 2,
            address: Address(
              latitude: 33.51689336744682,
              longitude: 36.26502357423305,
              region: 'Al Mouhajrin',
              city: ' Homs',
              country: 'Syria',
            ),
            space: '344',
            baths: '6',
            bedRooms: '5',
            storeys: '445',
            dateAdded: '2021-12-11',
            description: 'description111222',
            price: '56',
            image: [
              ImageObject(
                  originalPath: '/storage/emulated/0/Download/images (7).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (7).jpeg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Download/images (6).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (6).jpeg'),
            ],
            category: 'Sale'),

      ],
      address: Address(
        latitude: 33.50426786925087,
        longitude: 36.31582662463188,
        region: 'Al Shaghour',
        city: 'Damascus ',
        country: 'Syria',
      ),
    ),
    User(
      isAdmin: false,
      isSuperAdmin: false,
      id: 2,
      firstName: 'Abd Al kareem',
      lastName: 'Fiyad',
      sendTime: '05:10',
      email: 'abdfy@gmail.com',
      phoneNumber: '093343243234',
      messages: [
        'hi ayham',
        'hi ayham',
        'hi ayham',
        'hi ayham',
        'hi ayham',
        'hi ayham',
      ],
      image: File('/storage/emulated/0/Download/images (16).jpeg'),
      listProperty: [
        Property(
            idProperty: 2,
            address: Address(
              latitude: 33.51689336744682,
              longitude: 36.26502357423305,
              region: 'Al Mouhajrin',
              city: 'Alepo',
              country: 'Syria',
            ),
            space: '34',
            baths: '65',
            bedRooms: '54',
            storeys: '445',
            dateAdded: '2021-11-11',
            description: 'dsdfdsfescription111222',
            price: '56',
            image: [
              ImageObject(
                  originalPath: '/storage/emulated/0/Download/images (3).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (3).jpeg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Download/images (2).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (2).jpeg'),
            ],
            category: 'Sale'),
        Property(
            idProperty: 2,
            address: Address(
              latitude: 33.51689336744682,
              longitude: 36.26502357423305,
              region: 'Al Mouhajrin',
              city: ' Hama ',
              country: 'Syria',
            ),
            space: '34',
            baths: '65',
            bedRooms: '54',
            storeys: '445',
            dateAdded: '2021-11-11',
            description: 'description111222',
            price: '56',
            image: [
              ImageObject(
                  originalPath: '/storage/emulated/0/Download/images (5).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (5).jpeg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Download/images (4).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (4).jpeg'),
            ],
            category: 'Sale'),
      ],
      address: Address(
        latitude: 33.556982562518726,
        longitude: 36.36604227125645,
        region: 'Harasta',
        city: 'Gouvernorat de Damas',
        country: 'Syria',
      ),
    ),
  ];
}