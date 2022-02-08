import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../globals.dart';
import '../navigation.dart';

class MakeTickets extends ConsumerWidget {
  const MakeTickets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        30,
        8,
        30,
        8,
      ),
      child: Column(
        children: [
          eventIdentifier(context),
          Text(
            "Enter Following Details",
            style: Theme.of(context).textTheme.headline1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 28, 0, 2),
            child: TextFormField(
              controller: null,
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.person,
                    color: lightPurple,
                  ), // icon is 48px widget.
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: lightPurple, width: 2),
                  borderRadius: BorderRadius.circular(borderRadiusTheme),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: inputFieldBackgroundColor, width: 0),
                  borderRadius: BorderRadius.circular(borderRadiusTheme),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
                    color: lightPurple),
                labelText: "Full Name",
                fillColor: inputFieldBackgroundColor,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Field is empty";
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 2),
            child: TextFormField(
              controller: null,
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.mail,
                    color: lightPurple,
                  ), // icon is 48px widget.
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: lightPurple, width: 2),
                  borderRadius: BorderRadius.circular(borderRadiusTheme),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: inputFieldBackgroundColor, width: 0),
                  borderRadius: BorderRadius.circular(borderRadiusTheme),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
                    color: lightPurple),
                labelText: "Email Addres",
                fillColor: inputFieldBackgroundColor,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Field is empty";
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 2),
            child: TextFormField(
              controller: null,
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.phone,
                    color: lightPurple,
                  ), // icon is 48px widget.
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: lightPurple, width: 2),
                  borderRadius: BorderRadius.circular(borderRadiusTheme),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: inputFieldBackgroundColor, width: 0),
                  borderRadius: BorderRadius.circular(borderRadiusTheme),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
                    color: lightPurple),
                labelText: "Phone Number",
                fillColor: inputFieldBackgroundColor,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Field is empty";
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 2),
            child: TextFormField(
              controller: null,
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.person_add_sharp,
                    color: lightPurple,
                  ), // icon is 48px widget.
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: lightPurple, width: 2),
                  borderRadius: BorderRadius.circular(borderRadiusTheme),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: inputFieldBackgroundColor, width: 0),
                  borderRadius: BorderRadius.circular(borderRadiusTheme),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
                    color: lightPurple),
                labelText: "Persons",
                fillColor: inputFieldBackgroundColor,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Field is empty";
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,30,0,30),
            child: ElevatedButton(
              onPressed: () =>
                  ref.read(navigationNotifierProvider).selectPage(15),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                  child: Text(
                    "PRE PAYMENT",
                    style: TextStyle(
                        fontSize:
                        Theme.of(context).textTheme.bodyText2?.fontSize,
                        fontWeight: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.fontWeight,
                        fontFamily: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.fontFamily,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              style: lightButton,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,30),
            child: ElevatedButton(
              onPressed: () =>
                  ref.read(navigationNotifierProvider).selectPage(14),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                  child: Text(
                    "FULL PAYMENT",
                    style: TextStyle(
                        fontSize:
                        Theme.of(context).textTheme.bodyText2?.fontSize,
                        fontWeight: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.fontWeight,
                        fontFamily: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.fontFamily,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              style: greenButton,
            ),
          ),

        ],
      ),
    );
  }

  eventIdentifier(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 30, 30, 30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: lightPurple.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.category),
            Expanded(
              child: ListTile(
                title: Text(
                  "Ramanda Event",
                  style: TextStyle(
                      fontWeight:
                          Theme.of(context).textTheme.headline2!.fontWeight,
                      fontSize:
                          Theme.of(context).textTheme.headline2!.fontSize),
                ),
                subtitle: Text(
                  "24-11-2000",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
                      color: Colors.black38,
                      fontWeight:
                          Theme.of(context).textTheme.bodyText2!.fontWeight),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
              child: SizedBox(
                width: 34,
                height: 34,
                child: Image.asset('assets/Scan_Grey.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
