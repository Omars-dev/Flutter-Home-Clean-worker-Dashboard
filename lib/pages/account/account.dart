import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(20),
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              width: 74,
              height: 44,
              color: Colors.black12,
              alignment: Alignment.center,
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              'Accounts',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Colors.black),
            ),
          ),
          Container(
            color: const Color(0xFFF7F7F7),
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                      color: const Color(0xFFE9E9E9),
                      borderRadius: BorderRadius.circular(100)),
                  child: Image.asset('assets/img/profile.png'),
                ),
                const SizedBox(width: 35),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Md. Akkas Mia',style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                    ),),
                    const SizedBox(height: 7),
                    const Text(
                      'akkas.cse@gmail.com',
                      style: TextStyle(
                          color: Color(0xFF535151),
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    const SizedBox(height: 17),
                    Container(
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
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 25),
          Container(

          )
        ],
      ),
    );
  }
}
