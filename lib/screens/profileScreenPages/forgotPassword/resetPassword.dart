import 'package:ecommerce/screens/navscreen.dart';
import 'package:flutter/material.dart';

import '../../../api/apiUserAccounts.dart';
import '../../../utils/constants.dart';
import '../../../widgets/gradient.dart';
import '../../navScreens/profile.dart';

class ResetPassword extends StatefulWidget {
  final String phoneNumber;
  const ResetPassword({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  String password = "";
  String confirmPassword = "";

  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
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
              SizedBox(height: height * 0.285),
              Row(
                children: [
                  SizedBox(width: width * 0.05),
                  const Text(
                    'Enter new password',
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
                    'Confirm new password',
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
              SizedBox(height: height * 0.28),
              Row(
                children: [
                  SizedBox(width: width * 0.8),
                  TextButton(
                    onPressed: () {
                      if (confirmPassword == password && password.length >= 8) {
                        ApiUserAccounts apiClient = ApiUserAccounts();
                        apiClient
                            .resetPassword(widget.phoneNumber, password)
                            .then(
                          (value) {
                            if (value == 'Password Updated Successfully') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Password Updated Successfully'),
                                ),
                              );

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NavScreen(
                                    currentIndex: 4,
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Server Error')));
                            }
                          },
                        );
                      } else if (confirmPassword != password) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Password not confirmed correctly')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Password should be at least 8 characters long')));
                      }
                    },
                    child: const GradientMask(
                      child: Text('Submit'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
