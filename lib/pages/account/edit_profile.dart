import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final ImagePicker _imagePicker = ImagePicker();
  File? pickedImage;

  Future<void> _selectImage() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        pickedImage = File(pickedFile.path);
      });
    }
  }

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
              titlePadding: EdgeInsets.only(left: 45, right: 20, bottom: 12),
              title: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Edit Profile',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          //TODO: File Upload Profile Shape
                          GestureDetector(
                            onTap: _selectImage,
                            child: Center(
                              child: ClipOval(
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: pickedImage != null
                                      ? Image.file(
                                    pickedImage!,
                                    fit: BoxFit.cover,
                                  )
                                      : Image.asset('assets/img/profile.png'),
                                ),
                              ),
                            ),
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

                              //TODO: Image Upload Camera Button
                              child: IconButton(
                                padding: const EdgeInsets.all(5),
                                icon: const Icon(
                                  Icons.camera_alt,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                onPressed: _selectImage,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 35),

                    //TODO:
                  ],
                ),
                //TODO: Form Field
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.pink,
                        height: 200,
                        width: 428,
                      ),
                      SizedBox(height: 10,),
                      Container(
                        color: Colors.teal,
                        height: 200,
                        width: 428,
                      ),
                      SizedBox(height: 10,),
                      Container(
                        color: Colors.yellow,
                        height: 200,
                        width: 428,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
