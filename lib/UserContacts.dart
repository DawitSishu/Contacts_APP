// ignore_for_file: must_be_immutable, implementation_imports, prefer_const_constructors, unnecessary_import, unused_import, sort_child_properties_last, prefer_const_constructors_in_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'ContactInfo.dart';

import 'Contact.dart';

class UserContacts extends StatefulWidget {
  UserContacts({super.key});

  @override
  State<UserContacts> createState() => _UserContactsState();
}

class _UserContactsState extends State<UserContacts> {
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
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: ContactsList(contacts: contacts),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            Navigator.pushNamed(context, '/AddContacts'),
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class ContactsList extends StatelessWidget {
  const ContactsList({
    super.key,
    required this.contacts,
  });

  final List<Map<String, Object>> contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SingleContact(contacts: contacts),
            SingleContact(contacts: contacts),
            SingleContact(contacts: contacts),
          ],
        );
      },
    );
  }
}

class SingleContact extends StatelessWidget {
  const SingleContact({
    super.key,
    required this.contacts,
  });

  final List<Map<String, Object>> contacts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9, top: 25),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Color.fromARGB(133, 44, 44, 44),
            foregroundColor: Colors.white,
            radius: 30,
            child: IconButton(
              // color: Colors.white,
              icon: Icon(Icons.person),
              iconSize: 35,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactInfo()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Wrap(
              direction: Axis.vertical,
              children: <Widget>[
                Text(
                  "${contacts[0]['contact_name']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text("+251 ${contacts[0]['contact_number']}"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 135),
            child: IconButton(
              color: Color.fromARGB(255, 25, 214, 0),
              icon: Icon(Icons.call),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
