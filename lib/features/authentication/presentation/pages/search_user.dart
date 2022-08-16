import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project_111/core/paramaters.dart';
import 'package:project_111/features/authentication/presentation/pages/user_profile.dart';

import '../../../../tests/tests.dart';

class SearchUser extends StatefulWidget {
  static const routeName = 'SearchUser';

  const SearchUser({Key? key}) : super(key: key);

  @override
  State<SearchUser> createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  // List<User> allUsers = [
  //   User(
  //     isAdmin: true,
  //     isSuperAdmin: false,
  //     id: 1,
  //     firstName: 'Ayham',
  //     lastName: 'Alrefay',
  //     email: 'ayhamalrefay@gmail.com',
  //     phoneNumber: '0933773538',
  //     messages: [
  //       'hi ayham',
  //       'hi ayham',
  //       'hi ayham',
  //       'hi ayham',
  //     ],
  //     sendTime: '02:15',
  //     image: File('/storage/emulated/0/Download/images (17).jpeg'),
  //     listProperty: [
  //       Property(
  //           idProperty: 2,
  //           address: Address(
  //             latitude: 33.51689336744682,
  //             longitude: 36.26502357423305,
  //             region: 'Al Mouhajrin',
  //             city: ' Damascus ',
  //             country: 'Syria',
  //           ),
  //           space: '34',
  //           baths: '65',
  //           bedRooms: '54',
  //           storeys: '445',
  //           dateAdded: '2021-11-11',
  //           description: 'there is here description',
  //           price: '56',
  //           image: [
  //             ImageObject(
  //                 originalPath: '/storage/emulated/0/Download/images (9).jpeg',
  //                 modifiedPath: '/storage/emulated/0/Download/images (9).jpeg'),
  //             ImageObject(
  //                 originalPath: '/storage/emulated/0/Download/images (8).jpeg',
  //                 modifiedPath: '/storage/emulated/0/Download/images (8).jpeg'),
  //           ],
  //           category: 'Rent'),
  //       Property(
  //           idProperty: 2,
  //           address: Address(
  //             latitude: 33.51689336744682,
  //             longitude: 36.26502357423305,
  //             region: 'Al Mouhajrin',
  //             city: ' Homs',
  //             country: 'Syria',
  //           ),
  //           space: '344',
  //           baths: '6',
  //           bedRooms: '5',
  //           storeys: '445',
  //           dateAdded: '2021-12-11',
  //           description: 'description111222',
  //           price: '56',
  //           image: [
  //             ImageObject(
  //                 originalPath: '/storage/emulated/0/Download/images (7).jpeg',
  //                 modifiedPath: '/storage/emulated/0/Download/images (7).jpeg'),
  //             ImageObject(
  //                 originalPath: '/storage/emulated/0/Download/images (6).jpeg',
  //                 modifiedPath: '/storage/emulated/0/Download/images (6).jpeg'),
  //           ],
  //           category: 'Sale'),
  //
  //     ],
  //     address: Address(
  //       latitude: 33.50426786925087,
  //       longitude: 36.31582662463188,
  //       region: 'Al Shaghour',
  //       city: 'Damascus ',
  //       country: 'Syria',
  //     ),
  //   ),
  //   User(
  //     isAdmin: true,
  //     isSuperAdmin: false,
  //     id: 2,
  //     firstName: 'Abd Al kareem',
  //     lastName: 'Fiyad',
  //     sendTime: '05:10',
  //     email: 'abdfy@gmail.com',
  //     phoneNumber: '093343243234',
  //     messages: [
  //       'hi ayham',
  //       'hi ayham',
  //       'hi ayham',
  //       'hi ayham',
  //       'hi ayham',
  //       'hi ayham',
  //     ],
  //     image: File('/storage/emulated/0/Download/images (16).jpeg'),
  //     listProperty: [
  //       Property(
  //           idProperty: 2,
  //           address: Address(
  //             latitude: 33.51689336744682,
  //             longitude: 36.26502357423305,
  //             region: 'Al Mouhajrin',
  //             city: 'Alepo',
  //             country: 'Syria',
  //           ),
  //           space: '34',
  //           baths: '65',
  //           bedRooms: '54',
  //           storeys: '445',
  //           dateAdded: '2021-11-11',
  //           description: 'dsdfdsfescription111222',
  //           price: '56',
  //           image: [
  //             ImageObject(
  //                 originalPath: '/storage/emulated/0/Download/images (3).jpeg',
  //                 modifiedPath: '/storage/emulated/0/Download/images (3).jpeg'),
  //             ImageObject(
  //                 originalPath: '/storage/emulated/0/Download/images (2).jpeg',
  //                 modifiedPath: '/storage/emulated/0/Download/images (2).jpeg'),
  //           ],
  //           category: 'Sale'),
  //       Property(
  //           idProperty: 2,
  //           address: Address(
  //             latitude: 33.51689336744682,
  //             longitude: 36.26502357423305,
  //             region: 'Al Mouhajrin',
  //             city: ' Hama ',
  //             country: 'Syria',
  //           ),
  //           space: '34',
  //           baths: '65',
  //           bedRooms: '54',
  //           storeys: '445',
  //           dateAdded: '2021-11-11',
  //           description: 'description111222',
  //           price: '56',
  //           image: [
  //             ImageObject(
  //                 originalPath: '/storage/emulated/0/Download/images (5).jpeg',
  //                 modifiedPath: '/storage/emulated/0/Download/images (5).jpeg'),
  //             ImageObject(
  //                 originalPath: '/storage/emulated/0/Download/images (4).jpeg',
  //                 modifiedPath: '/storage/emulated/0/Download/images (4).jpeg'),
  //           ],
  //           category: 'Sale'),
  //     ],
  //     address: Address(
  //       latitude: 33.556982562518726,
  //       longitude: 36.36604227125645,
  //       region: 'Harasta',
  //       city: 'Gouvernorat de Damas',
  //       country: 'Syria',
  //     ),
  //   ),
  // ];
  List<Users>? searchedForUsers;
  final _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: Colors.green,
      decoration: const InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: 'Find a users...',
        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
      ),
      style:  Theme.of(context).textTheme.bodyText2,
      onChanged: (name) {
        addSearchedFOrItemsToSearchedList(name.replaceAll(' ', ''));
      },
    );
  }

  void addSearchedFOrItemsToSearchedList(String searchedUser) {
    searchedForUsers = Te.listUser1
        .where((users) => (users.firstName! + users.lastName!)
            .replaceAll(' ', '')
            .contains(searchedUser))
        .toList();
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchedForUsers!.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  }

   buildBody() {
    return searchedForUsers == null
        ? const Text('')
        : Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.separated(
              itemCount: searchedForUsers!.length,
              itemBuilder: (BuildContext context, index) {
                // Display the list item
                File? file = searchedForUsers![index].image;
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) {
                    setState(() {
                      searchedForUsers!.removeAt(index);
                    });
                  },
                  child: ListTile(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:(conetxt){
                        return UserProfile(user:searchedForUsers![index]);
                      }));
                    },
                    leading: CircleAvatar(
                      radius: 35,
                      backgroundImage: FileImage(file!),
                    ),
                    title: Text(
                      '${searchedForUsers![index].firstName} ${searchedForUsers![index].lastName}',
                      style:  TextStyle(color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                  background: Container(
                    color: Colors.red,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerRight,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 20,
              ),
            ),
          );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_outlined,
          color: Colors.green,
        ),
      ),
      title: _buildSearchField(),
    );
  }
}
