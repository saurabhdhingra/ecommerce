import 'package:ecommerce/api/apiUserAccounts.dart';
import 'package:ecommerce/screens/profileScreenPages/authentication/addressDetails.dart';
import 'package:ecommerce/widgets/gradient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constants.dart';
import 'dart:io' show Platform;

class ContactDetails extends StatefulWidget {
  final String phoneNumber;
  final String password;

  const ContactDetails(
      {super.key, required this.phoneNumber, required this.password});

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String city = '';
  String state = '';
  String pinCode = '';
  String address = '';
  String addressType = '';

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  addToken(String token, int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setInt('userId', userId);
  }

  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: width * 0.05),
                  const Text(
                    'ENTER YOUR DETAILS',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w800,
                        fontSize: 22),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Container(
                width: width * 0.95,
                height: height * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 15.0,
                      spreadRadius: 20.0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.01),
                    Row(
                      children: [
                        SizedBox(width: width * 0.05),
                        const Text(
                          'Contact Information',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      children: [
                        SizedBox(width: width * 0.05),
                        Text(
                          'First Name',
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Form(
                        key: _formKey1,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          onChanged: (value) {
                            setState(() {
                              firstName = value;
                            });
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        SizedBox(width: width * 0.05),
                        Text(
                          'Last Name',
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Form(
                        key: _formKey2,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          onChanged: (value) {
                            setState(
                              () {
                                lastName = value;
                              },
                            );
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        SizedBox(width: width * 0.05),
                        Text(
                          'Email',
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Form(
                        key: _formKey3,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          onChanged: (value) {
                            setState(
                              () {
                                email = value;
                              },
                            );
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        SizedBox(width: width * 0.05),
                        Text(
                          'Phone',
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Form(
                        child: Container(
                          width: width * 0.9,
                          height: height * 0.07,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                  style: BorderStyle.solid)),
                          child: Row(
                            children: [
                              SizedBox(width: width * 0.02),
                              Text(
                                widget.phoneNumber,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.05),
              Row(
                children: [
                  SizedBox(width: width * 0.8),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Platform.isIOS
                              ? CupertinoAlertDialog(
                                  title: const Text(
                                      'Please confirm the information before submitting'),
                                  actions: [
                                    CupertinoDialogAction(
                                      child: const Text('Ok'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    CupertinoDialogAction(
                                      child: const Text('Submit'),
                                      onPressed: () {
                                        if (email == "" &&
                                            firstName == "" &&
                                            lastName == "") {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'All the fields are mandatory'),
                                            ),
                                          );
                                        } else {
                                          ApiUserAccounts apiClient =
                                              ApiUserAccounts();
                                          apiClient
                                              .registerUser(
                                                  firstName.trim(),
                                                  lastName.trim(),
                                                  email.trim(),
                                                  widget.password,
                                                  widget.phoneNumber)
                                              .then(
                                            (value) {
                                              if (value ==
                                                      "phone number Already Registered" ||
                                                  value ==
                                                      "Email Already Registered") {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(value),
                                                  ),
                                                );
                                              } else {
                                                apiClient
                                                    .login(widget.phoneNumber,
                                                        widget.password)
                                                    .then(
                                                  (value) {
                                                    if (value ==
                                                        'Wrong Credientials !') {
                                                      Navigator.pop(context);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(
                                                            "Wrong Credientials !",
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      final parsed = value.cast<
                                                          String, dynamic>();
                                                      addToken(parsed["token"],
                                                          parsed["userId"]);
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              AddressDetails(
                                                                  id: value[
                                                                      "userId"],
                                                                  name: firstName +
                                                                      lastName,
                                                                  phoneNumber:
                                                                      widget
                                                                          .phoneNumber,
                                                                  token: value[
                                                                      "token"]),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                );
                                              }
                                            },
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                )
                              : AlertDialog(
                                  title: const Text(
                                      'Please confirm the information before submitting'),
                                  actions: [
                                    TextButton(
                                      child: const Text('Ok'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('Submit'),
                                      onPressed: () {
                                        if (email == "" &&
                                            firstName == "" &&
                                            lastName == "") {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text(
                                                'All the fields are mandatory'),
                                          ));
                                        } else {
                                          ApiUserAccounts apiClient =
                                              ApiUserAccounts();
                                          apiClient
                                              .registerUser(
                                                  firstName.trim(),
                                                  lastName.trim(),
                                                  email.trim(),
                                                  widget.password,
                                                  widget.phoneNumber)
                                              .then((value) {
                                            if (value ==
                                                    "phone number Already Registered" ||
                                                value ==
                                                    "Email Already Registered") {
                                              Navigator.pop(context);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(value),
                                                ),
                                              );
                                            }

                                            //else {
                                            //   if (value["status"] != 200) {
                                            //     Navigator.pop(context);
                                            //     ScaffoldMessenger.of(context)
                                            //         .showSnackBar(
                                            //       SnackBar(
                                            //         content:
                                            //             Text(value["error"]),
                                            //       ),
                                            //     );
                                            //   }
                                            else {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddressDetails(
                                                          id: value["userId"],
                                                          name: firstName +
                                                              lastName,
                                                          phoneNumber: widget
                                                              .phoneNumber,
                                                          token:
                                                              value["token"]),
                                                ),
                                              );
                                            }
                                          });
                                        }
                                      },
                                    )
                                  ],
                                );
                        },
                      );
                    },
                    child: const GradientMask(
                      child: Text('Submit'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
