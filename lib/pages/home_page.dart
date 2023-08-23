import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_clean_worker_dashboard/pages/account/account.dart';
import 'package:home_clean_worker_dashboard/widgets/dashboard_list_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/img/Profile Avatar.png'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hi,',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Tanvir Faysal',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.notifications,
                  color: Colors.black,
                  size: 24,
                ),
                const SizedBox(
                  width: 25,
                ),
                GestureDetector(
                  onTap: () {
                    print('Open Account Page');
                  },
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 500),
                          pageBuilder: (_, __, ___) => const MyAccount(),
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
                    child: const Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 75,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFF008951),
                          borderRadius: BorderRadius.circular(8)),
                      child: SvgPicture.asset(
                        'assets/img/working_city.svg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Working City',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 70,
                      height: 75,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFF008951),
                          borderRadius: BorderRadius.circular(8)),
                      child: Image.asset(
                        'assets/img/working_service.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Working Service',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 75,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFF008951),
                          borderRadius: BorderRadius.circular(8)),
                      child: SvgPicture.asset(
                        'assets/img/Zap.svg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Customize City & Price',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 75,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFF008951),
                          borderRadius: BorderRadius.circular(8)),
                      child: SvgPicture.asset(
                        'assets/img/add_member.svg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Add Member',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )
                  ],
                )),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 75,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFF008951),
                          borderRadius: BorderRadius.circular(8)),
                      child: SvgPicture.asset(
                        'assets/img/shift_viewer.svg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Shift \nViewer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 70,
                      height: 75,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFF008951),
                          borderRadius: BorderRadius.circular(8)),
                      child: SvgPicture.asset(
                        'assets/img/shift_config.svg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Shift \nConfig',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 75,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFF008951),
                          borderRadius: BorderRadius.circular(8)),
                      child: SvgPicture.asset(
                        'assets/img/completed.svg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Completed Service',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 75,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFF008951),
                          borderRadius: BorderRadius.circular(8)),
                      child: SvgPicture.asset(
                        'assets/img/analysis.svg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Service Analytics',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )
                  ],
                )),
              ],
            ),
            const SizedBox(height: 45),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(10.0),
                children: const [
                  DashboardListItem(
                      image: 'assets/img/req.png',
                      title: 'Requested Service',
                      subtitle: 'View All Services'),
                  SizedBox(height: 20),
                  DashboardListItem(
                      image: 'assets/img/req.png',
                      title: 'Upcoming Services',
                      subtitle: 'View All Service'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
