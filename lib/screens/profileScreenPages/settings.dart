import 'dart:io';
import 'package:ecommerce/widgets/gradient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool allNotifications = true;
  bool announcements = true;
  bool promotions = true;
  bool inapppurchases = true;
  bool deliveryupdates = true;
  bool deliverysms = true;
  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Settings',
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(children: [
        ListTile(
          leading: const Icon(CupertinoIcons.bell),
          title: const Text('Notifications'),
          trailing: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  enableDrag: false,
                  isDismissible: false,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: ((context) => StatefulBuilder(
                        builder: (context, setState) {
                          return notificatonsSheet();
                        },
                      )),
                );
              },
              icon: const Icon(Icons.chevron_right)),
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: Stack(children: [
            const Align(
                alignment: Alignment.centerLeft, child: Text('Language')),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: width * 0.2,
                height: height * 0.03,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(
                    Radius.circular(height * 0.015),
                  ),
                ),
                child: const Center(child: Text('English')),
              ),
            )
          ]),
          trailing: IconButton(
              onPressed: () {
                // showModalBottomSheet(
                //     context: context,
                //     builder: ((context) => notificatonsSheet()));
              },
              icon: const Icon(Icons.chevron_right)),
        ),
        ListTile(
          leading: const Icon(CupertinoIcons.chat_bubble),
          title: const Text('Write to chat'),
          trailing: IconButton(
              onPressed: () {
                // showModalBottomSheet(
                //     context: context,
                //     builder: ((context) => notificatonsSheet()));
              },
              icon: const Icon(Icons.chevron_right)),
        ),
        ListTile(
          leading: const Icon(CupertinoIcons.star),
          title: const Text('Vote on App Store'),
          trailing: IconButton(
              onPressed: () {
                // showModalBottomSheet(
                //     context: context,
                //     builder: ((context) => notificatonsSheet()));
              },
              icon: const Icon(Icons.chevron_right)),
        ),
        ListTile(
          leading: const Icon(CupertinoIcons.question_circle),
          title: const Text('FAQ'),
          trailing: IconButton(
              onPressed: () {
                // showModalBottomSheet(
                //     context: context,
                //     builder: ((context) => notificatonsSheet()));
              },
              icon: const Icon(Icons.chevron_right)),
        )
      ]),
    );
  }

  Widget notificatonsSheet() {
    return StatefulBuilder(
      builder: ((context, setState) {
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
                      GradientMask(
                        child: TextButton(
                          child: const Text('Close'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 1, height: height * 0.02),
                  ListTile(
                    title: const Text(
                      'All Notifications',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                    trailing: Platform.isIOS
                        ? CupertinoSwitch(
                            value: allNotifications,
                            onChanged: (value) {
                              setState(
                                () {
                                  allNotifications = !allNotifications;
                                },
                              );
                            },
                          )
                        : Switch(
                            value: allNotifications,
                            onChanged: (value) {
                              setState(
                                () {
                                  allNotifications = !allNotifications;
                                },
                              );
                            },
                          ),
                  ),
                  Divider(thickness: 1, height: height * 0.02),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Enable notifications to recieve delivery updates and promotions',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Divider(thickness: 1, height: height * 0.02),
                  ListTile(
                    title: const Text(
                      'Anouncements',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                    trailing: Platform.isIOS
                        ? CupertinoSwitch(
                            value: announcements,
                            onChanged: (value) {
                              setState(
                                () {
                                  announcements = !announcements;
                                },
                              );
                            },
                          )
                        : Switch(
                            value: announcements,
                            onChanged: (value) {
                              setState(
                                () {
                                  announcements = !announcements;
                                },
                              );
                            },
                          ),
                  ),
                  Divider(thickness: 1, height: height * 0.02),
                  ListTile(
                    title: const Text(
                      'Promotions',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                    trailing: Platform.isIOS
                        ? CupertinoSwitch(
                            value: promotions,
                            onChanged: (value) {
                              setState(
                                () {
                                  promotions = !promotions;
                                },
                              );
                            },
                          )
                        : Switch(
                            value: promotions,
                            onChanged: (value) {
                              setState(
                                () {
                                  promotions = !promotions;
                                },
                              );
                            },
                          ),
                  ),
                  Divider(thickness: 1, height: height * 0.02),
                  ListTile(
                    title: const Text(
                      'In App',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                    trailing: Platform.isIOS
                        ? CupertinoSwitch(
                            value: inapppurchases,
                            onChanged: (value) {
                              setState(
                                () {
                                  inapppurchases = !inapppurchases;
                                },
                              );
                            },
                          )
                        : Switch(
                            value: inapppurchases,
                            onChanged: (value) {
                              setState(
                                () {
                                  inapppurchases = !inapppurchases;
                                },
                              );
                            },
                          ),
                  ),
                  Divider(thickness: 1, height: height * 0.02),
                  ListTile(
                    title: const Text(
                      'Delivery Updates',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                    trailing: Platform.isIOS
                        ? CupertinoSwitch(
                            value: deliveryupdates,
                            onChanged: (value) {
                              setState(
                                () {
                                  deliveryupdates = !deliveryupdates;
                                },
                              );
                            },
                          )
                        : Switch(
                            value: deliveryupdates,
                            onChanged: (value) {
                              setState(() {
                                deliveryupdates = !deliveryupdates;
                              });
                            },
                          ),
                  ),
                  Divider(thickness: 1, height: height * 0.02),
                  ListTile(
                    title: const Text(
                      'Delivery SMS notifications',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                    trailing: Platform.isIOS
                        ? CupertinoSwitch(
                            value: deliverysms,
                            onChanged: (value) {
                              setState(
                                () {
                                  deliverysms = !deliverysms;
                                },
                              );
                            },
                          )
                        : Switch(
                            value: deliverysms,
                            onChanged: (value) {
                              setState(() {
                                deliverysms = !deliverysms;
                              });
                            },
                          ),
                  ),
                  Divider(thickness: 1, height: height * 0.02),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
