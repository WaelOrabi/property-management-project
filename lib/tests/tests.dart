import 'dart:io';
import 'package:advance_image_picker/advance_image_picker.dart';
import 'package:project_111/core/paramaters.dart';
import 'package:project_111/core/widgets/address.dart';
import 'package:project_111/core/widgets/user.dart';
class Te {

  static List<NotificationParametersMessage> notificationMessage =[
    NotificationParametersMessage(
        firstName: 'abd',
        lastName: 'Al Karaem',
        image: File('/storage/emulated/0/Pictures/Homs.jpg'),
        idProperty: 1,
        message: 'hi wael'),
    NotificationParametersMessage(
        firstName: 'abd',
        lastName: 'Al Karaem',
        image: File('/storage/emulated/0/Pictures/Homs.jpg'),
        idProperty: 3,
        message: 'hi wael'),
    NotificationParametersMessage(
        firstName: 'abd',
        lastName: 'Al Karaem',
        image: File('/storage/emulated/0/Pictures/Homs.jpg'),
        idProperty: 3),
  ];
  static User user = User(
    isAdmin: true,
    isSuperAdmin: true,
    id: 1,
    firstName: 'Ayham',
    lastName: 'Alrefay',
    email: 'ayhamalrefay@gmail.com',
    phoneNumber: '0933773538',
    image: File(
        '/storage/emulated/0/Download/images (17).jpeg'),
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
                originalPath: '/storage/emulated/0/Download/images.jpeg',
                modifiedPath: '/storage/emulated/0/Download/images.jpeg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Download/images (1).jpeg',
                modifiedPath: '/storage/emulated/0/Download/images (1).jpeg'),
          ],
          category: 'Rent'),


      // Property(
      //     idProperty: 2,
      //     address: Address(
      //       latitude: 33.51689336744682,
      //       longitude: 36.26502357423305,
      //       region: 'Al Mouhajrin',
      //       city: ' Damascus ',
      //       country: 'Syria',
      //     ),
      //     space: '34',
      //     baths: '65',
      //     bedRooms: '54',
      //     storeys: '445',
      //     dateAdded: '2021-11-11',
      //     description: 'description111222',
      //     price: '56',
      //     image: [
      //       ImageObject(
      //           originalPath: '/storage/emulated/0/Download/images (7).jpeg',
      //           modifiedPath: '/storage/emulated/0/Download/images (7).jpeg'),
      //       ImageObject(
      //           originalPath: '/storage/emulated/0/Download/images (6).jpeg',
      //           modifiedPath: '/storage/emulated/0/Download/images (6).jpeg'),
      //     ],
      //     category: 'Buy'),
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
                originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_03319962B1C27B93E9EFE77649031F2E_compressed971672072.jpg',
                modifiedPath: '/storage/emulated/0/Download/images (5).jpeg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_A0A0002AEAAAE361B9FB7B6405F17073_compressed1643451173.jpg',
                modifiedPath: '/storage/emulated/0/Download/images (9).jpeg'),
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
              originalPath: '/storage/emulated/0/Download/images.jpeg',
              modifiedPath: '/storage/emulated/0/Download/images.jpeg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Download/images (1).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (1).jpeg'),
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
              originalPath: '/storage/emulated/0/Download/images (5).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (5).jpeg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Download/images (4).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (4).jpeg'),
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
              originalPath: '/storage/emulated/0/Download/images (3).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (3).jpeg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Download/images (3).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (3).jpeg'),
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
              originalPath: '/storage/emulated/0/Download/images (7).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (7).jpeg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Download/images (6).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (6).jpeg'),
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
        description: 'description111222',
        price: '56',
        image: [
          ImageObject(
              originalPath: '/storage/emulated/0/Download/images.jpeg',
              modifiedPath: '/storage/emulated/0/Download/images.jpeg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Download/images (1).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (1).jpeg'),
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
              originalPath: '/storage/emulated/0/Download/images (5).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (5).jpeg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Download/images (4).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (4).jpeg'),
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
              originalPath: '/storage/emulated/0/Download/images (3).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (3).jpeg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Download/images (3).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (3).jpeg'),
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
              originalPath: '/storage/emulated/0/Download/images (7).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (7).jpeg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Download/images (6).jpeg',
              modifiedPath: '/storage/emulated/0/Download/images (6).jpeg'),
        ],
        category: 'Rent'),
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
      image: File(
          '/storage/emulated/0/Download/images (17).jpeg'),
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
                  originalPath: '/storage/emulated/0/Download/images (7).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (7).jpeg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Download/images (6).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (6).jpeg'),
            ],
            category: 'Buy'),
      ],
      address: Address(
        latitude: 33.40426786925087,
        longitude: 36.31582667463188,
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
      email: 'abdfy@gmail.com',
      phoneNumber: '093343243234',
      image: File(
          '/storage/emulated/0/Download/depositphotos_20201449-stock-photo-attractive-businessman-being-worried-and.jpg' ),
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
                  originalPath: '/storage/emulated/0/Download/images (7).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (7).jpeg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Download/images (6).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (6).jpeg'),
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
                  originalPath: '/storage/emulated/0/Download/images (7).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (7).jpeg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Download/images (6).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (6).jpeg'),
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
                  originalPath: '/storage/emulated/0/Download/images (7).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (7).jpeg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Download/images (6).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (6).jpeg'),
            ],
            category: 'Buy'),
      ],
      address: Address(
        latitude: 33.556982562518726,
        longitude: 36.36604227125645,
        region: 'Harasta',
        city: 'Gouvernorat de Damas',
        country: 'Syria',
      ),
    ),
    User(
      isAdmin: false,
      isSuperAdmin: false,
      id: 2,
      firstName: 'Wael',
      lastName: 'Orabi',
      email: 'wael@gmail.com',
      phoneNumber: '093343243234',
      image: File(
          '/storage/emulated/0/Download/depositphotos_12560182-stock-photo-handsome-man-with-eyeglasses.jpg' ),
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
                  originalPath: '/storage/emulated/0/Download/images (7).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (7).jpeg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Download/images (6).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (6).jpeg'),
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
                  originalPath: '/storage/emulated/0/Download/images (7).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (7).jpeg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Download/images (6).jpeg',
                  modifiedPath: '/storage/emulated/0/Download/images (6).jpeg'),
            ],
            category: 'Buy'),
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
