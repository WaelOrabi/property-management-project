import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project_111/features/authentication/presentation/pages/user_profile.dart';

import '../../../../tests/tests.dart';
import '../../domain/entities/user.dart';

class SearchUser extends StatefulWidget {
  static const routeName = 'SearchUser';

  const SearchUser({Key? key}) : super(key: key);

  @override
  State<SearchUser> createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
 
  List<User>? searchedForUsers;
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
        .where((users) => (users.firstName + users.lastName)
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
