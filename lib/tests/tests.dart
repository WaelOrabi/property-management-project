import 'dart:io';
import 'package:advance_image_picker/advance_image_picker.dart';
import 'package:camera/camera.dart';
import 'package:project_111/core/paramaters.dart';

class Te {
  static List<NotificationParametersMessage> notificationMessage =[
    NotificationParametersMessage(
        firstName: 'abd',
        lastName: 'Al Karaem',
        image:  File('/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg'),
        idProperty: 1,
        message: 'hi wael'),
    NotificationParametersMessage(
        firstName: 'abd',
        lastName: 'Al Karaem',
        image:File('/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg'),
        idProperty: 3,
        message: 'hi wael'),
  ];
  static Users user = Users(
    isAdmin: true,
    isSuperAdmin: true,
    id: 1,
    firstName: 'Ayham',
    lastName: 'Alrefay',
    email: 'ayhamalrefay@gmail.com',
    phoneNumber: '0933773538',
    image: File('/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg'),
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
            ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
                modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')
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



            ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
                modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')

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

            ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
                modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')


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


            ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
                modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')

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


             ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
                 modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')


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


             ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
                 modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')


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


            ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
                modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')

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


            ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
                modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')

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

          ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
              modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')


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


          ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
              modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')


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


          ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
              modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')


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




          ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
              modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')
          ],
        category: 'Sale'),
  ];
  static List<Property> listProperty1 = [
    Property(
        idProperty: 2,
        address: Address(
          latitude: 33.5168943235682,
          longitude: 36.2243523305,
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

          ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
              modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')




        ],
        category: 'Sale'),
    Property(
        idProperty: 2,
        address: Address(
          latitude: 33.51689452444682,
          longitude: 36.2650243543423305,
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


          ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
              modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')



        ],
        category: 'Sale'),
    Property(
        idProperty: 2,
        address: Address(
          latitude: 33.51652324744682,
          longitude: 36.26524327423305,
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



          ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
              modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')

          ],
        category: 'Sale'),
    Property(
        idProperty: 2,
        address: Address(
          latitude: 33.51689546342,
          longitude: 36.2650356323305,
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



          ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
              modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')


        ],
        category: 'Sale'),
  ];

  static List<Users> listUser1 = [
    Users(
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
      image:File('/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg'),
      listProperty: [
        Property(
            idProperty: 2,
            address: Address(
              latitude: 33.51689332345682,
              longitude: 36.2650233643305,
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


              ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
                  modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')


            ],
            category: 'Sale'),
        Property(
            idProperty: 2,
            address: Address(
              latitude: 33.516893334634682,
              longitude: 36.2650235365305,
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




              ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
                  modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')
            ],
            category: 'Sale'),
        Property(
            idProperty: 2,
            address: Address(
              latitude: 33.51689243644682,
              longitude: 36.265023623423305,
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



            ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
                modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')

          ],
            category: 'Sale'),
        Property(
            idProperty: 2,
            address: Address(
              latitude: 33.516894326744682,
              longitude: 36.2650224423305,
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



            ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
                modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')
          ],
            category: 'Sale'),
      ],
      address: Address(
        latitude: 33.5042672354,
        longitude: 36.315824523188,
        region: 'Al Shaghour',
        city: 'Damascus ',
        country: 'Syria',
      ),
    ),
    Users(
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
              latitude: 33.516893456474343,
              longitude: 36.2650235365345,
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

              ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
                  modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')


          ],
            category: 'Sale'),
        Property(
            idProperty: 2,
            address: Address(
              latitude: 33.51676456782,
              longitude: 36.26503563423305,
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


              ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
                  modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')



            ],
            category: 'Sale'),
        Property(
            idProperty: 2,
            address: Address(
              latitude: 33.516893363453682,
              longitude: 36.2650235345305,
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


            ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
                modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')

          ],
            category: 'Sale'),
        Property(
            idProperty: 2,
            address: Address(
              latitude: 33.51689363482,
              longitude: 36.2650543423305,
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

            ImageObject(originalPath:'/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg' ,
                modifiedPath: '/data/user/0/com.example.project_111/cache/image_picker4809430930998662570.jpg')
          ],
            category: 'Sale'),
      ],
      address: Address(
        latitude: 33.556982346356,
        longitude: 36.366054365645,
        region: 'Harasta',
        city: 'Gouvernorat de Damas',
        country: 'Syria',
      ),
    ),
  ];
}
