import 'dart:io';
import 'package:advance_image_picker/advance_image_picker.dart';
import '../core/paramaters.dart';
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
    image: File('/storage/emulated/0/Pictures/Homs.jpg'),
    messages: [
      'hi ayham',
      'hi ayham',
      'hi ayham',
      'hi ayham',
    ],
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
                originalPath: '/storage/emulated/0/Pictures/Damascus.jpg',
                modifiedPath: '/storage/emulated/0/Pictures/Damascus.jpg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Pictures/Latakia.jpg ',
                modifiedPath: '/storage/emulated/0/Pictures/Latakia.jpg '),
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
                originalPath: '/storage/emulated/0/Pictures/Damascus.jpg',
                modifiedPath: '/storage/emulated/0/Pictures/Damascus.jpg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Pictures/Latakia.jpg',
                modifiedPath: '/storage/emulated/0/Pictures/Latakia.jpg'),
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
                originalPath: '/storage/emulated/0/Pictures/Homs.jpg',
                modifiedPath: '/storage/emulated/0/Pictures/Homs.jpg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Pictures/Hama.jpg',
                modifiedPath: '/storage/emulated/0/Pictures/Hama.jpg'),
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
                originalPath: '/storage/emulated/0/Pictures/Homs.jpg',
                modifiedPath: '/storage/emulated/0/Pictures/Homs.jpg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Pictures/Hama.jpg',
                modifiedPath: '/storage/emulated/0/Pictures/Hama.jpg'),
          ],
          category: 'Buy'),
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
                originalPath: '/storage/emulated/0/Pictures/Damascus.jpg',
                modifiedPath: '/storage/emulated/0/Pictures/Damascus.jpg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Pictures/Latakia.jpg',
                modifiedPath: '/storage/emulated/0/Pictures/Latakia.jpg'),
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
                originalPath: '/storage/emulated/0/Pictures/Damascus.jpg',
                modifiedPath: '/storage/emulated/0/Pictures/Damascus.jpg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Pictures/Latakia.jpg',
                modifiedPath: '/storage/emulated/0/Pictures/Latakia.jpg'),
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
                originalPath: '/storage/emulated/0/Pictures/Homs.jpg',
                modifiedPath: '/storage/emulated/0/Pictures/Homs.jpg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Pictures/Hama.jpg',
                modifiedPath: '/storage/emulated/0/Pictures/Hama.jpg'),
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
                originalPath: '/storage/emulated/0/Pictures/Homs.jpg',
                modifiedPath: '/storage/emulated/0/Pictures/Homs.jpg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Pictures/Hama.jpg',
                modifiedPath: '/storage/emulated/0/Pictures/Hama.jpg'),
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
              originalPath: '/storage/emulated/0/Pictures/Damascus.jpg',
              modifiedPath: '/storage/emulated/0/Pictures/Damascus.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Pictures/Latakia.jpg',
              modifiedPath: '/storage/emulated/0/Pictures/Latakia.jpg'),
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
              originalPath: '/storage/emulated/0/Pictures/Damascus.jpg',
              modifiedPath: '/storage/emulated/0/Pictures/Damascus.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Pictures/Latakia.jpg',
              modifiedPath: '/storage/emulated/0/Pictures/Latakia.jpg'),
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
              originalPath: '/storage/emulated/0/Pictures/Homs.jpg',
              modifiedPath: '/storage/emulated/0/Pictures/Homs.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Pictures/Hama.jpg',
              modifiedPath: '/storage/emulated/0/Pictures/Hama.jpg'),
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
              originalPath: '/storage/emulated/0/Pictures/Homs.jpg',
              modifiedPath: '/storage/emulated/0/Pictures/Homs.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Pictures/Hama.jpg',
              modifiedPath: '/storage/emulated/0/Pictures/Hama.jpg'),
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
              originalPath: '/storage/emulated/0/Pictures/Damascus.jpg',
              modifiedPath: '/storage/emulated/0/Pictures/Damascus.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Pictures/Latakia.jpg',
              modifiedPath: '/storage/emulated/0/Pictures/Latakia.jpg'),
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
              originalPath: '/storage/emulated/0/Pictures/Damascus.jpg',
              modifiedPath: '/storage/emulated/0/Pictures/Damascus.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Pictures/Latakia.jpg',
              modifiedPath: '/storage/emulated/0/Pictures/Latakia.jpg'),
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
              originalPath: '/storage/emulated/0/Pictures/Homs.jpg',
              modifiedPath: '/storage/emulated/0/Pictures/Homs.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Pictures/Hama.jpg',
              modifiedPath: '/storage/emulated/0/Pictures/Hama.jpg'),
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
              originalPath: '/storage/emulated/0/Pictures/Homs.jpg',
              modifiedPath: '/storage/emulated/0/Pictures/Homs.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Pictures/Hama.jpg',
              modifiedPath: '/storage/emulated/0/Pictures/Hama.jpg'),
        ],
        category: 'Buy'),
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
      image: File('/storage/emulated/0/Pictures/Damascus.jpg'),
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
                  originalPath: '/storage/emulated/0/Pictures/Damascus.jpg',
                  modifiedPath: '/storage/emulated/0/Pictures/Damascus.jpg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Pictures/Latakia.jpg',
                  modifiedPath: '/storage/emulated/0/Pictures/Latakia.jpg'),
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
                  originalPath: '/storage/emulated/0/Pictures/Damascus.jpg',
                  modifiedPath: '/storage/emulated/0/Pictures/Damascus.jpg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Pictures/Latakia.jpg',
                  modifiedPath: '/storage/emulated/0/Pictures/Latakia.jpg'),
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
                  originalPath: '/storage/emulated/0/Pictures/Homs.jpg',
                  modifiedPath: '/storage/emulated/0/Pictures/Homs.jpg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Pictures/Hama.jpg',
                  modifiedPath: '/storage/emulated/0/Pictures/Hama.jpg'),
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
                  originalPath: '/storage/emulated/0/Pictures/Homs.jpg',
                  modifiedPath: '/storage/emulated/0/Pictures/Homs.jpg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Pictures/Hama.jpg',
                  modifiedPath: '/storage/emulated/0/Pictures/Hama.jpg'),
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
      image: File('/storage/emulated/0/Pictures/Damascus.jpg'),
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
                  originalPath: '/storage/emulated/0/Pictures/Damascus.jpg',
                  modifiedPath: '/storage/emulated/0/Pictures/Damascus.jpg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Pictures/Latakia.jpg',
                  modifiedPath: '/storage/emulated/0/Pictures/Latakia.jpg'),
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
                  originalPath: '/storage/emulated/0/Pictures/Damascus.jpg',
                  modifiedPath: '/storage/emulated/0/Pictures/Damascus.jpg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Pictures/Latakia.jpg',
                  modifiedPath: '/storage/emulated/0/Pictures/Latakia.jpg'),
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
                  originalPath: '/storage/emulated/0/Pictures/Homs.jpg',
                  modifiedPath: '/storage/emulated/0/Pictures/Homs.jpg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Pictures/Hama.jpg',
                  modifiedPath: '/storage/emulated/0/Pictures/Hama.jpg'),
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
                  originalPath: '/storage/emulated/0/Pictures/Homs.jpg',
                  modifiedPath: '/storage/emulated/0/Pictures/Homs.jpg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Pictures/Hama.jpg',
                  modifiedPath: '/storage/emulated/0/Pictures/Hama.jpg'),
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
