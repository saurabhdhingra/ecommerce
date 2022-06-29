import 'package:ecommerce/screens/profileScreenPages/forgotPassword/verifyOTP.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants.dart';

class EnterNumber extends StatefulWidget {
  const EnterNumber({Key? key}) : super(key: key);

  @override
  State<EnterNumber> createState() => _EnterNumberState();
}

class _EnterNumberState extends State<EnterNumber> {
  String phoneNumber = "";

  final _formKey1 = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black87,
          ),
          elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.3),
              Row(
                children: [
                  SizedBox(width: width * 0.05),
                  const Text(
                    'Please verify your Phone Number',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Form(
                    key: _formKey1,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: '+91 ',
                      cursorColor: Colors.black,
                      onChanged: (value) {
                        setState(() {
                          phoneNumber = value;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    )),
              ),
              SizedBox(height: height * 0.02),
              GestureDetector(
                onTap: () {
                  if (phoneNumber.length == 14) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => VerifyOTPReset(
                              phone: phoneNumber,
                            )));
                  }
                },
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Color.fromARGB(255, 55, 70, 253),
                        Color.fromARGB(255, 122, 35, 160),
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  height: height * 0.05,
                  width: width * 0.9,
                  child: const Center(
                    child: Text(
                      "Send OTP",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
