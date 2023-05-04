// ignore_for_file: implementation_imports, unused_import, unnecessary_import, prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, empty_statements, sort_child_properties_last

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  ContactInfo({super.key});
  var contacts = [
    {
      'contact_name': 'someone',
      'contact_father': 'someone',
      'contact_number': 9123456789
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Color.fromARGB(255, 0, 0, 0),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: Text('Contacts'),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: UserContacts(contacts: contacts),
      ),
    );
  }
}

class UserContacts extends StatelessWidget {
  const UserContacts({
    super.key,
    required this.contacts,
  });

  final List<Map<String, Object>> contacts;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 130, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Color.fromARGB(144, 44, 44, 44),
                  foregroundColor: Colors.white,
                  radius: 50,
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.person),
                      iconSize: 85,
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Wrap(
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete),
                        iconSize: 25,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  "Delete contact",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: Text(
                                    "Are you sure you want to remove ${contacts[0]['contact_name']} ${contacts[0]['contact_name']} from your contacts?"),
                                actions: [
                                  TextButton(
                                    child: Text("No"),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black,
                                    ),
                                    onPressed: () {},
                                  ),
                                  TextButton(
                                    child: Text(
                                      "Yes",
                                    ),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.red,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        color: Color.fromARGB(133, 44, 44, 44),
                        iconSize: 25,
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            child: Text(
              "${contacts[0]['contact_name']} ${contacts[0]['contact_name']}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "+251${contacts[0]['contact_number']}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 79, 214, 1),
                      foregroundColor: Colors.white,
                      radius: 22,
                      child: Center(
                        child: IconButton(
                          icon: Icon(Icons.call),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 228, 231, 11),
                    foregroundColor: Colors.white,
                    radius: 22,
                    child: Center(
                      child: IconButton(
                        icon: Icon(Icons.message),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 40),
            child: Row(
              children: [
                Text(
                  "Call history",
                  style: TextStyle(
                    color: Color.fromARGB(133, 44, 44, 44),
                  ),
                ),
              ],
            ),
          ),
          CallHistory(contacts: contacts),
          CallHistory(contacts: contacts),
        ]),
      ),
    );
  }
}

class CallHistory extends StatelessWidget {
  const CallHistory({
    super.key,
    required this.contacts,
  });

  final List<Map<String, Object>> contacts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Flex(direction: Axis.vertical, children: [
        Row(
          children: <Widget>[
            Text(
              "Apr 27, 14:16",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: [
                Text("+251 ${contacts[0]['contact_number']}"),
                Icon(
                  Icons.arrow_outward,
                  color: Color.fromARGB(133, 44, 44, 44),
                  size: 12,
                ),
              ],
            ),
            Text(
              "Didn’t connect",
            )
          ],
        ),
      ]),
    );
  }
}
