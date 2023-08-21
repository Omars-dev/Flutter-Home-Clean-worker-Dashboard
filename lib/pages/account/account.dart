import 'package:flutter/material.dart';
import 'package:home_clean_worker_dashboard/pages/account/edit_profile.dart';
import 'package:home_clean_worker_dashboard/widgets/divider.dart';
import 'package:home_clean_worker_dashboard/widgets/setting_items.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

// class MyAccount extends StatelessWidget {
//   const MyAccount({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: Colors.transparent,
//         leading: Padding(
//           padding: const EdgeInsets.all(20),
//           child: GestureDetector(
//             onTap: (){
//               Navigator.pop(context);
//             },
//             child: Container(
//               width: 74,
//               height: 44,
//               color: Colors.transparent,
//               alignment: Alignment.center,
//               child: const Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//               child: Text(
//                 'Accounts',
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 30,
//                     color: Colors.black),
//               ),
//             ),
//
//             //TODO: User Section
//             Container(
//               color: const Color(0xFFF7F7F7),
//               padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
//               child: Row(
//                 children: [
//                   // Container(
//                   //   width: 110,
//                   //   height: 110,
//                   //   decoration: BoxDecoration(
//                   //       color: const Color(0xFFE9E9E9),
//                   //       borderRadius: BorderRadius.circular(100)),
//                   //   child: Image.asset('assets/img/profile.png'),
//                   // ),
//
//                   Container(
//                     width: 110,
//                     height: 110,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFE9E9E9),
//                       borderRadius: BorderRadius.circular(100),
//                     ),
//                     child: Stack(
//                       children: [
//                         Center(
//                           child: Image.asset('assets/img/profile.png'),
//                         ),
//                         Positioned(
//                           bottom: 5,
//                           right: 5 ,
//                           child: Container(
//                             width: 28,
//                             height: 28,
//                             decoration: const BoxDecoration(
//                               color: Color(0xFF008951),
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Icon(
//                               Icons.camera_alt,
//                               size: 16,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 35),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       const Text('Md. Akkas Mia',style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black
//                       ),),
//                       const SizedBox(height: 5),
//                       const Text(
//                         'akkas.cse@gmail.com',
//                         style: TextStyle(
//                             color: Color(0xFF535151),
//                             fontWeight: FontWeight.w400,
//                             fontSize: 16),
//                       ),
//                       const SizedBox(height: 17),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 5, horizontal: 15),
//                         height: 30,
//                         decoration: BoxDecoration(
//                             color: const Color(0xFF008951),
//                             borderRadius: BorderRadius.circular(20)),
//                         child: const Text(
//                           'Edit Profile',
//                           style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//
//             //TODO: Settings Option
//             const SizedBox(height: 10),
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   buildSettingOption(Icons.account_circle, 'Account'),
//                   buildDivider(),
//                   buildSettingOption(Icons.add_circle, 'Add Member'),
//                   buildDivider(),
//                   buildSettingOption(Icons.people, 'Worker Management'),
//                   buildDivider(),
//                   buildSettingOption(Icons.check_circle, 'Completed Service'),
//                   buildDivider(),
//                   buildSettingOption(Icons.analytics, 'Analytics'),
//                   buildDivider(),
//                   buildSettingOption(Icons.notifications, 'Notification'),
//                   buildDivider(),
//                   buildSettingOption(Icons.logout, 'Logout'),
//                   buildDivider(),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Icon(Icons.arrow_back, color: Colors.black),
                ),
              ),
              centerTitle: false,
              flexibleSpace: const FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 45, right: 20, bottom: 25),
                title: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Accounts',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              expandedHeight: 130,
              floating: false,
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  //TODO: User Section
                  Container(
                    color: const Color(0xFFF7F7F7),
                    padding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE9E9E9),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Image.asset('assets/img/profile.png'),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF008951),
                                    shape: BoxShape.circle,
                                  ),

                                  //TODO: Static Profile Image
                                  child: const Icon(
                                    Icons.camera_alt,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 35),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Md. Akkas Mia', style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                            ),),
                            const SizedBox(height: 5),
                            const Text(
                              'akkas.cse@gmail.com',
                              style: TextStyle(
                                  color: Color(0xFF535151),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                            const SizedBox(height: 15),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: const Duration(milliseconds: 500),
                                    pageBuilder: (_, __, ___) => const EditProfile(),
                                    transitionsBuilder: (_, animation, __, child) {
                                      const begin = Offset(1.0, 0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.easeInOut;
                                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                      var offsetAnimation = animation.drive(tween);
                                      return SlideTransition(position: offsetAnimation, child: child);
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                height: 30,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF008951),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  //TODO: Settings Option
                  const SizedBox(height: 10),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       buildSettingOption(Icons.account_circle, 'Account'),
                  //       buildDivider(),
                  //       buildSettingOption(Icons.add_circle, 'Add Member'),
                  //       buildDivider(),
                  //       buildSettingOption(Icons.people, 'Worker Management'),
                  //       buildDivider(),
                  //       buildSettingOption(Icons.check_circle, 'Completed Service'),
                  //       buildDivider(),
                  //       buildSettingOption(Icons.analytics, 'Analytics'),
                  //       buildDivider(),
                  //       buildSettingOption(Icons.notifications, 'Notification'),
                  //       buildDivider(),
                  //       buildSettingOption(Icons.logout, 'Logout'),
                  //       buildDivider(),
                  //     ],
                  //   ),
                  // ),

                  // ...
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildSettingOption(
                            'assets/icons/account_icon.svg', 'Account'),
                        buildDivider(),
                        buildSettingOption(
                            'assets/icons/add_member_icon.svg', 'Add Member'),
                        buildDivider(),
                        buildSettingOption(
                            'assets/icons/worker_management_ico.svg',
                            'Worker Management'),
                        buildDivider(),
                        buildSettingOption(
                            'assets/icons/completed_service_icon.svg',
                            'Completed Service'),
                        buildDivider(),
                        buildSettingOption(
                            'assets/icons/analytics_icon.svg', 'Analytics'),
                        buildDivider(),
                        buildSettingOption('assets/icons/notification_icon.svg',
                            'Notification'),
                        buildDivider(),
                        buildSettingOption(
                            'assets/icons/logout_icon.svg', 'Logout'),
                        buildDivider(),
                      ],
                    ),
                  ),
// ...

                ],
              ),
            ),
          ],
        ),
      );
    }
  }