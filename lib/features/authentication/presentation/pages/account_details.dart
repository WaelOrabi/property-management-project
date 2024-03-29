import 'package:flutter/material.dart';
import '../../../../core/widgets/widget_appbar.dart';
import '../../domain/entities/user.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({Key? key,this.user}) : super(key: key);
  static String routeName = 'Account Details';
final User? user;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Theme.of(context).backgroundColor,
        appBar: buildAppBar(
            namePage: "Account Details",
            fun: () =>
                Navigator.of(context).pop(),
            color: Colors.white),
        body: buildBody(context),
      ),
    );
  }

  Column buildBody(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text("PUBLIC INFO", style: TextStyle(color: Colors.grey, fontSize: 25)),
          const SizedBox(height: 20),
          buildContainer(
            context: context,
            textI1: "First Name :",
            textI2: "Last Name :",
            textF1: "${user!.firstName}",
            textF2: "${user!.lastName}",
          ),
          const SizedBox(height: 20),
          const Text("PRIVATE DETAILS",
              style: TextStyle(color: Colors.grey, fontSize: 25)),
          const SizedBox(height: 20),
          buildContainer(
            context: context,
            textI1: "Email Address :",
            textI2: "Phone Number :",
            textF1: "${user!.email}",
            textF2: "${user!.phoneNumber}",
          ),
        ],
      );
  }

  Container buildContainer(
      {required BuildContext context,
      required String textI1,
      required String textI2,
      required String textF1,
      required String textF2}) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.all(16),
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          children: [
            buildRow(text1: textI1, text2: textF1),
            const SizedBox(height: 40),
            buildRow(text1: textI2, text2: textF2),
          ],
        ),
      ),
    );
  }

   buildRow({required String text1, required String text2}) {
    return Builder(
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text1, style:  TextStyle(fontSize: 15,color: Theme.of(context).colorScheme.secondary)),
            Text(text2,
                style:  TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.secondary)),
          ],
        );
      }
    );
  }
}
