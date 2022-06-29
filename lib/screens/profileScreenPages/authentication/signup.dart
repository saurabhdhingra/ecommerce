import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../profileScreenPages/authentication/verifyOTP.dart';
import '../../../utils/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String phoneNumber = "";
  String password = "";
  String confirmPassword = "";

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
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
              SizedBox(height: height * 0.15),
              SizedBox(
                width: width * 0.7,
                height: height * 0.1,
                child: const Image(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  SizedBox(width: width * 0.05),
                  const Text(
                    'Phone',
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
              Row(
                children: [
                  SizedBox(width: width * 0.05),
                  const Text(
                    'Password',
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
                  key: _formKey2,
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      setState(
                        () {
                          password = value;
                        },
                      );
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    obscureText: true,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  SizedBox(width: width * 0.05),
                  const Text(
                    'Confirm password',
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
                  key: _formKey3,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      setState(
                        () {
                          confirmPassword = value;
                        },
                      );
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    obscureText: true,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              GestureDetector(
                onTap: () {
                  if (confirmPassword == password && phoneNumber.length == 14) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Verify(
                              phone: phoneNumber,
                              password: password,
                            )));
                  } else if (confirmPassword != password &&
                      phoneNumber.length == 10) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Password not confirmed correctly')));
                  } else if (confirmPassword != password &&
                      phoneNumber.length == 10) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please enter a 10 digit phone number')));
                  } else if (confirmPassword == password &&
                      phoneNumber.length == 14 &&
                      password.length <= 8) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Please enter a password at least 8 characters long.')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Please enter a 10 digit phone number and the password is also not confirmed correctly')));
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
