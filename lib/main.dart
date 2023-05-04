// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, avoid_print, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'AddContacts.dart';
import 'UserContacts.dart';
import 'ContactInfo.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => MyHomePage(),
        '/AddContacts': (BuildContext context) => AddContactsPage(),
        '/ContactInfo': (BuildContext context) => ContactInfo(),
        // '/UserContacts': (BuildContext context) => UserContacts(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //no contacts
    // List<Map<String, Object>> contacts = [];

    // some contact
    List<Map<String, Object>> contacts = [
      {
        'contact_name': 'someone',
        'contact_father': 'someone',
        'contact_number': 9123456789
      },
    ];

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
        body:
            contacts.isEmpty ? NoContacts() : ContactsList(contacts: contacts),
        floatingActionButton: SizedBox(
          width: 80,
          height: 80,
          child: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 1, 217, 255),
            onPressed: () => {
              Navigator.pushNamed(context, '/AddContacts'),
            },
            tooltip: 'Increment',
            child: const Icon(
              Icons.add,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}

class NoContacts extends StatelessWidget {
  const NoContacts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Image.asset(
                'assets/img/box2.png',
                height: 150,
                width: 150,
              ),
            ),
            Text(
              'You have no contacts yet',
              style: TextStyle(fontSize: 20.0),
            )
          ]),
    );
  }
}
