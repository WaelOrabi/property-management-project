import 'dart:io';
import 'package:advance_image_picker/advance_image_picker.dart';
import 'package:project_111/core/widgets/address.dart';
import 'package:project_111/core/widgets/property.dart';
import 'package:project_111/core/widgets/user.dart';

class Te {
  static User user = User(
    isAdmin: true,
    isSuperAdmin: true,
    id: 1,
    firstName: 'Ayham',
    lastName: 'Alrefay',
    email: 'ayhamalrefay@gmail.com',
    phoneNumber: '0933773538',
    image: File(
        '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_7E1EB7B8AA0A7FABFAC203C1A6137CF0_compressed1883771032.jpg'),
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
                originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_A5DC8E9E6DBA812B6712E33B565E2F11_compressed2078732055.jpg',
                modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_A5DC8E9E6DBA812B6712E33B565E2F11_compressed2078732055.jpg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_69639202EE85EFA5B812FD7F16DD0806_compressed2043302628.jpg',
                modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_69639202EE85EFA5B812FD7F16DD0806_compressed2043302628.jpg'),
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
                originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_8B3B7BE218651DECB476C67887EA0B10_compressed1102317137.jpg',
                modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_8B3B7BE218651DECB476C67887EA0B10_compressed1102317137.jpg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_1B6B618A64CFE64C7167A9976333F714_compressed909174491.jpg',
                modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_1B6B618A64CFE64C7167A9976333F714_compressed909174491.jpg'),
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
                originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_9F9D047C3591B09FD59752FB3B4A1608_compressed822778935.jpg',
                modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_9F9D047C3591B09FD59752FB3B4A1608_compressed822778935.jpg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_96EE50B8A82C5E8280A772569BE7E926_compressed1094262150.jpg',
                modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_96EE50B8A82C5E8280A772569BE7E926_compressed1094262150.jpg'),
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
                originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_96EE50B8A82C5E8280A772569BE7E926_compressed1094262150.jpg',
                modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_96EE50B8A82C5E8280A772569BE7E926_compressed1094262150.jpg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12142-_0FD5A278D3BECE20B0B6543861AAFDD3_compressed385760924.jpg',
                modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12142-_0FD5A278D3BECE20B0B6543861AAFDD3_compressed385760924.jpg'),
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
                originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_03319962B1C27B93E9EFE77649031F2E_compressed971672072.jpg',
                modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_03319962B1C27B93E9EFE77649031F2E_compressed971672072.jpg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_7D255B72DB6B06520C0FF73EFCBEB003_compressed970376841.jpg',
                modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_7D255B72DB6B06520C0FF73EFCBEB003_compressed970376841.jpg'),
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
                originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_A24708A5260E5649332A0D6E21E7033E_compressed66548609.jpg',
                modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_A24708A5260E5649332A0D6E21E7033E_compressed66548609.jpg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_A0A0002AEAAAE361B9FB7B6405F17073_compressed1643451173.jpg',
                modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_A0A0002AEAAAE361B9FB7B6405F17073_compressed1643451173.jpg'),
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
                originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_56FB98E782972415FBC3B5E6D58C95DE_compressed1515115830.jpg',
                modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_56FB98E782972415FBC3B5E6D58C95DE_compressed1515115830.jpg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_8AA7B1CC325BB0737E8651E376340AD9_compressed1515996224.jpg',
                modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_8AA7B1CC325BB0737E8651E376340AD9_compressed1515996224.jpg'),
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
                originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_4D39120F14E910E4EC7BC9418A76D540_compressed471264703.jpg',
                modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_4D39120F14E910E4EC7BC9418A76D540_compressed471264703.jpg'),
            ImageObject(
                originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_E09865D087DB80EBD111F3F9D9AAAB04_compressed1283329199.jpg',
                modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_E09865D087DB80EBD111F3F9D9AAAB04_compressed1283329199.jpg'),
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
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_03319962B1C27B93E9EFE77649031F2E_compressed971672072.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_03319962B1C27B93E9EFE77649031F2E_compressed971672072.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_7D255B72DB6B06520C0FF73EFCBEB003_compressed970376841.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_7D255B72DB6B06520C0FF73EFCBEB003_compressed970376841.jpg'),
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
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_A24708A5260E5649332A0D6E21E7033E_compressed66548609.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_A24708A5260E5649332A0D6E21E7033E_compressed66548609.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_A0A0002AEAAAE361B9FB7B6405F17073_compressed1643451173.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_A0A0002AEAAAE361B9FB7B6405F17073_compressed1643451173.jpg'),
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
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_56FB98E782972415FBC3B5E6D58C95DE_compressed1515115830.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_56FB98E782972415FBC3B5E6D58C95DE_compressed1515115830.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_8AA7B1CC325BB0737E8651E376340AD9_compressed1515996224.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_8AA7B1CC325BB0737E8651E376340AD9_compressed1515996224.jpg'),
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
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_4D39120F14E910E4EC7BC9418A76D540_compressed471264703.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_4D39120F14E910E4EC7BC9418A76D540_compressed471264703.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_E09865D087DB80EBD111F3F9D9AAAB04_compressed1283329199.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_E09865D087DB80EBD111F3F9D9AAAB04_compressed1283329199.jpg'),
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
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_A5DC8E9E6DBA812B6712E33B565E2F11_compressed2078732055.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_A5DC8E9E6DBA812B6712E33B565E2F11_compressed2078732055.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_69639202EE85EFA5B812FD7F16DD0806_compressed2043302628.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_69639202EE85EFA5B812FD7F16DD0806_compressed2043302628.jpg'),
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
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_8B3B7BE218651DECB476C67887EA0B10_compressed1102317137.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_8B3B7BE218651DECB476C67887EA0B10_compressed1102317137.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_1B6B618A64CFE64C7167A9976333F714_compressed909174491.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_1B6B618A64CFE64C7167A9976333F714_compressed909174491.jpg'),
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
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_9F9D047C3591B09FD59752FB3B4A1608_compressed822778935.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_9F9D047C3591B09FD59752FB3B4A1608_compressed822778935.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_96EE50B8A82C5E8280A772569BE7E926_compressed1094262150.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_96EE50B8A82C5E8280A772569BE7E926_compressed1094262150.jpg'),
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
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_96EE50B8A82C5E8280A772569BE7E926_compressed1094262150.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_96EE50B8A82C5E8280A772569BE7E926_compressed1094262150.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12142-_0FD5A278D3BECE20B0B6543861AAFDD3_compressed385760924.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12142-_0FD5A278D3BECE20B0B6543861AAFDD3_compressed385760924.jpg'),
        ],
        category: 'Buy'),
  ];
  static List<Property> listProperty1 = [
    Property(
        idProperty: 1,
        address: Address(
          latitude: 33.47377474684087,
          longitude: 36.24984193593264,
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
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_A5DC8E9E6DBA812B6712E33B565E2F11_compressed2078732055.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_A5DC8E9E6DBA812B6712E33B565E2F11_compressed2078732055.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_69639202EE85EFA5B812FD7F16DD0806_compressed2043302628.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_69639202EE85EFA5B812FD7F16DD0806_compressed2043302628.jpg'),
        ],
        category: 'Investment'),
    Property(
        idProperty: 2,
        address: Address(
          latitude: 33.51679336744682,
          longitude: 36.265057423305,
          region: 'Al Medan',
          city: ' Damascus ',
          country: 'Syria',
        ),
        space: '343532',
        baths: '6',
        bedRooms: '3',
        storeys: '24',
        dateAdded: '2021-11-11',
        description: 'descrfdsfgfdlhshlkjhfshfslhfsdhsfdfhlskffjjfjjjjjjjjjjjjjjjjgsjghieuwry347erwy7ewyuiehslfjnx,cmvxncvdsfkssjs,sniption111222',
        price: '56334845',
        image: [
          ImageObject(
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_8B3B7BE218651DECB476C67887EA0B10_compressed1102317137.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_8B3B7BE218651DECB476C67887EA0B10_compressed1102317137.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_1B6B618A64CFE64C7167A9976333F714_compressed909174491.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_1B6B618A64CFE64C7167A9976333F714_compressed909174491.jpg'),
        ],
        category: 'Buy'),
    Property(
        idProperty: 3,
        address: Address(
          latitude: 33.50780237812886,
          longitude: 36.28105916082859,
          region: 'Al kanwat',
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
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_9F9D047C3591B09FD59752FB3B4A1608_compressed822778935.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_9F9D047C3591B09FD59752FB3B4A1608_compressed822778935.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_96EE50B8A82C5E8280A772569BE7E926_compressed1094262150.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_96EE50B8A82C5E8280A772569BE7E926_compressed1094262150.jpg'),
        ],
        category: 'Rent'),
    Property(
        idProperty: 4,
        address: Address(
          latitude: 33.49487386721038,
          longitude: 36.35117009282112,
          region: 'Al Mou',
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
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_96EE50B8A82C5E8280A772569BE7E926_compressed1094262150.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_96EE50B8A82C5E8280A772569BE7E926_compressed1094262150.jpg'),
          ImageObject(
              originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12142-_0FD5A278D3BECE20B0B6543861AAFDD3_compressed385760924.jpg',
              modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12142-_0FD5A278D3BECE20B0B6543861AAFDD3_compressed385760924.jpg'),
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
      image: File(
          '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_4D39120F14E910E4EC7BC9418A76D540_compressed471264703.jpg'),
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
                  originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_9F9D047C3591B09FD59752FB3B4A1608_compressed822778935.jpg',
                  modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_9F9D047C3591B09FD59752FB3B4A1608_compressed822778935.jpg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_96EE50B8A82C5E8280A772569BE7E926_compressed1094262150.jpg',
                  modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_96EE50B8A82C5E8280A772569BE7E926_compressed1094262150.jpg'),
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
          '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12072-_E09865D087DB80EBD111F3F9D9AAAB04_compressed1283329199.jpg' ),
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
                  originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_8B3B7BE218651DECB476C67887EA0B10_compressed1102317137.jpg',
                  modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_8B3B7BE218651DECB476C67887EA0B10_compressed1102317137.jpg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_1B6B618A64CFE64C7167A9976333F714_compressed909174491.jpg',
                  modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_1B6B618A64CFE64C7167A9976333F714_compressed909174491.jpg'),
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
                  originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_9F9D047C3591B09FD59752FB3B4A1608_compressed822778935.jpg',
                  modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_9F9D047C3591B09FD59752FB3B4A1608_compressed822778935.jpg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_96EE50B8A82C5E8280A772569BE7E926_compressed1094262150.jpg',
                  modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_96EE50B8A82C5E8280A772569BE7E926_compressed1094262150.jpg'),
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
                  originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_96EE50B8A82C5E8280A772569BE7E926_compressed1094262150.jpg',
                  modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12212-_96EE50B8A82C5E8280A772569BE7E926_compressed1094262150.jpg'),
              ImageObject(
                  originalPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12142-_0FD5A278D3BECE20B0B6543861AAFDD3_compressed385760924.jpg',
                  modifiedPath: '/storage/emulated/0/Android/data/com.example.project_111/cache/magazine-unlock-01-2.3.12142-_0FD5A278D3BECE20B0B6543861AAFDD3_compressed385760924.jpg'),
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
