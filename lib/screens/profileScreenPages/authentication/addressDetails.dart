import 'package:ecommerce/screens/navscreen.dart';
import 'package:ecommerce/widgets/gradient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../api/apiUserAccounts.dart';
import '../../../utils/constants.dart';
import 'dart:io' show Platform;

class AddressDetails extends StatefulWidget {
  final int id;
  final String name;
  final String phoneNumber;
  final String token;
  const AddressDetails(
      {super.key,
      required this.id,
      required this.name,
      required this.phoneNumber,
      required this.token});

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  String city = '';
  String state = 'Andhra Pradesh';
  String pinCode = '';
  String address = '';
  String addressType = 'Residential';

  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();
  final _formKey7 = GlobalKey<FormState>();
  final _formKey8 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
          onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const NavScreen(
                        currentIndex: 4,
                      ))),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                height: height * 0.615,
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
                          'Shipping Information',
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
                          'City',
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
                        key: _formKey4,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          onChanged: (value) {
                            setState(
                              () {
                                city = value;
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
                          'State or Union Territory',
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
                        key: _formKey5,
                        child: Platform.isIOS
                            ? CupertinoPicker(
                                backgroundColor: Colors.white,
                                diameterRatio: 0.8,
                                useMagnifier: true,
                                magnification: 2,
                                itemExtent: height * 0.035,
                                onSelectedItemChanged: (int value) {
                                  setState(() {
                                    state = states[value];
                                  });
                                },
                                children: states
                                    .map(
                                      (e) => Center(
                                        child: Text(
                                          e.toString(),
                                          style: TextStyle(
                                              fontSize: width * 0.03,
                                              color: Colors.black87),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              )
                            : DropdownButton<String>(
                                dropdownColor: Colors.white,
                                isExpanded: true,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.bold),
                                value: state,
                                onChanged: (value) {
                                  int intValue =
                                      value == null ? 0 : states.indexOf(value);
                                  setState(() {
                                    state = states[intValue];
                                  });
                                },
                                items: states
                                    .map(
                                      (e) => DropdownMenuItem<String>(
                                        value: e,
                                        child: Center(
                                          child: Text(
                                            e.toString(),
                                            style: TextStyle(
                                                fontSize: width * 0.03,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        SizedBox(width: width * 0.05),
                        Text(
                          'Pincode',
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
                        key: _formKey6,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          onChanged: (value) {
                            setState(
                              () {
                                pinCode = value;
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
                          'Address',
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
                        key: _formKey7,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          onChanged: (value) {
                            setState(
                              () {
                                address = value;
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
                          'Address Type',
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
                        key: _formKey8,
                        child: Platform.isIOS
                            ? CupertinoPicker(
                                backgroundColor: Colors.white,
                                diameterRatio: 0.8,
                                useMagnifier: true,
                                magnification: 2,
                                itemExtent: height * 0.035,
                                onSelectedItemChanged: (int value) {
                                  setState(() {
                                    addressType = addressTypes[value];
                                  });
                                },
                                children: addressTypes
                                    .map(
                                      (e) => Center(
                                        child: Text(
                                          e.toString(),
                                          style: TextStyle(
                                              fontSize: width * 0.03,
                                              color: Colors.black87),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              )
                            : DropdownButton<String>(
                                dropdownColor: Colors.white,
                                isExpanded: true,
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                                value: addressType,
                                onChanged: (value) {
                                  int intValue = value == null
                                      ? 0
                                      : addressTypes.indexOf(value);
                                  setState(() {
                                    state = addressTypes[intValue];
                                  });
                                },
                                items: addressTypes
                                    .map(
                                      (e) => DropdownMenuItem<String>(
                                        value: e,
                                        child: Center(
                                          child: Text(
                                            e.toString(),
                                            style: TextStyle(
                                                fontSize: width * 0.03,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
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
                                            if (city == "" &&
                                                pinCode == "" &&
                                                address == "" &&
                                                addressType == "") {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'All the fields are mandatory'),
                                              ));
                                            } else {}
                                            ApiUserAccounts _apiClient =
                                                ApiUserAccounts();
                                            _apiClient
                                                .addAddress(
                                                    widget.id,
                                                    city,
                                                    state,
                                                    pinCode,
                                                    widget.name,
                                                    widget.phoneNumber,
                                                    address,
                                                    addressType,
                                                    widget.token)
                                                .then(
                                                  (value) =>
                                                      Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const NavScreen(
                                                        currentIndex: 4,
                                                      ),
                                                    ),
                                                  ),
                                                );
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
                                            if (city == "" &&
                                                pinCode == "" &&
                                                address == "" &&
                                                addressType == "") {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'All the fields are mandatory'),
                                              ));
                                            } else {}
                                            ApiUserAccounts _apiClient =
                                                ApiUserAccounts();
                                            _apiClient
                                                .addAddress(
                                                    widget.id,
                                                    city,
                                                    state,
                                                    pinCode,
                                                    widget.name,
                                                    widget.phoneNumber,
                                                    address,
                                                    addressType,
                                                    widget.token)
                                                .then(
                                                  (value) => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const NavScreen(
                                                        currentIndex: 4,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                          },
                                        )
                                      ],
                                    );
                            });
                      },
                      child: const GradientMask(child: Text('Submit')))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
