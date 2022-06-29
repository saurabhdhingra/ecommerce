import 'package:ecommerce/screens/profileScreenPages/authentication/contactDetails.dart';
import 'package:ecommerce/screens/profileScreenPages/forgotPassword/enterNumber.dart';
import 'package:ecommerce/widgets/profilePageTabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/apiUserAccounts.dart';
import '../../models/account.dart';
import '../../utils/functions.dart';
import '../navscreen.dart';
import '../profileScreenPages/authentication/addressDetails.dart';
import '../profileScreenPages/export.dart';
import '../../utils/constants.dart';
import '../profileScreenPages/authentication/signup.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String loginCredential = "";
  String password = "";

  late UserAccount account;

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  bool isLoading = false;
  bool isLoggedIn = false;

  ApiUserAccounts apiClient = ApiUserAccounts();

  addToken(String token, int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setInt('userId', userId);
    prefs.setBool('isLoggedIn', true);
  }

  Future getData() async {
    setState(() {
      isLoading = true;
    });
    int userId = await getUserId();
    isLoggedIn = await getIsLoggedIn();
    if (isLoggedIn) {
      var response = await apiClient.getAccountDetails(userId.toString());
      if (response == 'Error') {
        account = UserAccount(0, '', '', '', '', '', '');
      } else {
        account = response;
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Color(0xFF403F3C),
            ),
          )
        : isLoggedIn
            ? Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: height * 0.01),
                        const Text(
                          "Profile",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        SizedBox(height: height * 0.03),
                        Container(
                          height: width / 4,
                          width: width / 4,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 15.0,
                                spreadRadius: 5.0,
                              )
                            ],
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            // boxShadow: [
                            //   BoxShadow(
                            //       offset: const Offset(2, 2),
                            //       color: Colors.grey.shade100,
                            //       spreadRadius: 10,
                            //       blurRadius: 2)
                            // ],
                          ),
                          child: account.userProfileimagepath == null
                              ? Image.asset('assets/defaultpfp.png',
                                  fit: BoxFit.fitHeight)
                              : Image.network(
                                  account.userProfileimagepath ??
                                      'https://www.pngitem.com/middle/mmhwxJ_user-windows-10-user-icon-png-transparent-png/',
                                  fit: BoxFit.fitHeight),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          account.userName ?? '',
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          account.userPhonenumber ?? '',
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        SizedBox(height: height * 0.02),
                        GestureDetector(
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const ContactDetails(
                          //           phoneNumber: '+91 9819873285',
                          //           password: 'saurabh20'),
                          //     ),
                          //   );
                          // },
                          onTap: () => showModalBottomSheet(
                              isScrollControlled: true,
                              enableDrag: false,
                              isDismissible: false,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) => signIn()),
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
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        ProfilePageTab(
                          icon: CupertinoIcons.bag,
                          label: "About Us",
                          isShadows: true,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AboutUs(),
                              ),
                            );
                          },
                        ),
                        ProfilePageTab(
                          icon: CupertinoIcons.reply,
                          label: "Returns",
                          isShadows: false,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Returns(),
                              ),
                            );
                          },
                        ),
                        ProfilePageTab(
                          icon: CupertinoIcons.cube_box,
                          label: "Order History",
                          isShadows: false,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OrderHistory(),
                              ),
                            );
                          },
                        ),
                        ProfilePageTab(
                          icon: CupertinoIcons.creditcard,
                          label: "Payment",
                          isShadows: false,
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const Payment(),
                            //   ),
                            // );
                          },
                        ),
                        ProfilePageTab(
                          icon: CupertinoIcons.book,
                          label: "Contacts",
                          isShadows: false,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Contacts(),
                              ),
                            );
                          },
                        ),
                        ProfilePageTab(
                          icon: CupertinoIcons.settings,
                          label: "Setings",
                          isShadows: false,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Settings(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: height * 0.01),
                        const Text(
                          "Profile",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        SizedBox(height: height * 0.03),
                        Container(
                          height: width / 4,
                          width: width / 4,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 15.0,
                                spreadRadius: 5.0,
                              )
                            ],
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            // boxShadow: [
                            //   BoxShadow(
                            //       offset: const Offset(2, 2),
                            //       color: Colors.grey.shade100,
                            //       spreadRadius: 10,
                            //       blurRadius: 2)
                            // ],
                          ),
                          child: Image.asset('assets/defaultpfp.png',
                              fit: BoxFit.fitHeight),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          "Welcome",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                        ),
                        SizedBox(height: height * 0.02),
                        const Text(
                          "Sign In to take full advantage of the app",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        SizedBox(height: height * 0.02),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ContactDetails(
                                    phoneNumber: '+91 9816272885',
                                    password: 'saurabh20'),
                              ),
                            );
                          },
                          // onTap: () => showModalBottomSheet(
                          //     isScrollControlled: true,
                          //     enableDrag: false,
                          //     isDismissible: false,
                          //     backgroundColor: Colors.transparent,
                          //     context: context,
                          //     builder: (context) => signIn()),
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
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        ProfilePageTab(
                          icon: CupertinoIcons.bag,
                          label: "About Us",
                          isShadows: true,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AboutUs(),
                              ),
                            );
                          },
                        ),
                        ProfilePageTab(
                          icon: CupertinoIcons.reply,
                          label: "Returns",
                          isShadows: false,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Returns(),
                              ),
                            );
                          },
                        ),
                        ProfilePageTab(
                          icon: CupertinoIcons.cube_box,
                          label: "Delivery",
                          isShadows: false,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Delivery(),
                              ),
                            );
                          },
                        ),
                        ProfilePageTab(
                          icon: CupertinoIcons.creditcard,
                          label: "Payment",
                          isShadows: false,
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const Payment(),
                            //   ),
                            // );
                          },
                        ),
                        ProfilePageTab(
                          icon: CupertinoIcons.book,
                          label: "Contacts",
                          isShadows: false,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Contacts(),
                              ),
                            );
                          },
                        ),
                        ProfilePageTab(
                          icon: CupertinoIcons.settings,
                          label: "Setings",
                          isShadows: false,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Settings(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
  }

  Widget signIn() {
    return DraggableScrollableSheet(
      initialChildSize: 0.95,
      builder: (_, controller) {
        var height = SizeConfig.getHeight(context);
        var width = SizeConfig.getWidth(context);

        return Container(
          padding: EdgeInsets.all(width * 0.01),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: width * 0.8),
                  TextButton(
                    child: const Text('Close'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: width * 0.29),
                  SizedBox(
                    width: width * 0.4,
                    height: width * 0.4,
                    child: const Image(
                      image: AssetImage('assets/icon.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.06),
              RichText(
                text: TextSpan(
                  text:
                      'To Sign In, you can use an existing\n    account from the site ',
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Navyat',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.06),
              Row(
                children: [
                  SizedBox(width: width * 0.05),
                  const Text(
                    'Login Email/Phone',
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
                      cursorColor: Colors.black,
                      onChanged: (value) {
                        if (value.length == 10 && num.tryParse(value) != null) {
                          setState(() {
                            loginCredential = '+91 $value';
                          });
                        } else {
                          setState(() {
                            loginCredential = value;
                          });
                        }
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
              Row(
                children: [
                  SizedBox(width: width * 0.65),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EnterNumber()));
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.04),
              GestureDetector(
                onTap: () {
                  ApiUserAccounts apiClient = ApiUserAccounts();
                  apiClient.login(loginCredential, password).then((value) {
                    if (value == 'Wrong password') {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Wrong Password')));
                    } else if (value == 'Server Error') {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Server Error')));
                    } else if (value == 'Wrong Credientials !') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Wrong Credientials !')));
                    } else {
                      final parsed = value.cast<String, dynamic>();
                      addToken(parsed["token"], parsed["userId"]);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Signed in successfully')));
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const NavScreen(currentIndex: 4),
                        ),
                      );
                    }
                  });
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
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                  TextButton(
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 13),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUp();
                          },
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
