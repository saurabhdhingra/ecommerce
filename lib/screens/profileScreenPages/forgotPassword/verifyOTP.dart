import 'package:ecommerce/screens/profileScreenPages/forgotPassword/enterNumber.dart';
import 'package:ecommerce/screens/profileScreenPages/forgotPassword/resetPassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class VerifyOTPReset extends StatefulWidget {
  final String phone;

  const VerifyOTPReset({super.key, required this.phone});

  @override
  State<VerifyOTPReset> createState() => _VerifyOTPResetState();
}

class _VerifyOTPResetState extends State<VerifyOTPReset> {
  String otp = "";
  String _verificationCode = "";
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.phone.replaceAll(' ', ''),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const EnterNumber()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: const Duration(seconds: 120));
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ),
      ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: height * 0.25),
          Row(
            children: [
              SizedBox(width: width * 0.05),
              const Text(
                'Enter OTP',
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
              key: _formKey,
              child: TextFormField(
                cursorColor: Colors.black,
                onChanged: (value) {
                  setState(() {
                    otp = value;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.06),
          GestureDetector(
            onTap: () async {
              try {
                await FirebaseAuth.instance
                    .signInWithCredential(PhoneAuthProvider.credential(
                        verificationId: _verificationCode, smsCode: otp))
                    .then((value) async {
                  if (value.user != null) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResetPassword(
                                  phoneNumber: widget.phone,
                                )),
                        (route) => false);
                  }
                });
              } catch (e) {
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Invalid OTP')));
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
                  "Verify OTP",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
