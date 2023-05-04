// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddContactsPage extends StatefulWidget {
  @override
  State<AddContactsPage> createState() => _AddContactsPageState();
}

class _AddContactsPageState extends State<AddContactsPage> {
  //to track the form and validate it
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Color.fromARGB(255, 0, 0, 0),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: Text('Add Contacts'),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Show a validation box before navigating back.
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      "Delete everything?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Text("Are you sure you want to remove everything"),
                    actions: [
                      TextButton(
                        child: Text("No"),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text(
                          "Yes",
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                        onPressed: () {
                          // Navigate back.
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a Snackbar.
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please provide full data.')));
                  }
                }),
          ],
        ),
        body: ContactForm(formKey: _formKey));
  }
}

class ContactForm extends StatelessWidget {
  const ContactForm({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 5),
              child: Text(
                "Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                // fillColor: Color.fromRGBO(250, 250, 250, 1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide.none,
                ),
                labelText: 'Enter Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name can\'t be empty';
                }
                return null;
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 5),
              child: Text(
                "Surname",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide.none,
                ),
                labelText: 'Enter surname',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Surname can\'t be empty';
                }
                return null;
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 5),
              child: Text(
                "Phone number",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide.none,
                ),
                labelText: '+251  _ _   _ _ _   _ _   _ _',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              maxLength: 9,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Phone number can\'t be empty';
                } else if (value.length != 9) {
                  return 'Phone number must be 9 chars long';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
