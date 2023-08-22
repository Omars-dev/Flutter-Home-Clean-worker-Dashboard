import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        pickedImage = File(pickedFile.path);
      });
    }
  }

  String _selectedCountry = 'USA';

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
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
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
                    fontSize: 28,
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
                Expanded(
                  child: Row(
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
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          width: 194,
                          padding: const EdgeInsets.only(top: 16,left: 10,bottom: 3),
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                                hintText: 'First Name',
                                hintStyle: TextStyle(
                                    color: Colors.white
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none
                                )
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width:10),
                      Expanded(
                        child: Container(
                          height: 50,
                          width: 194,
                          padding: const EdgeInsets.only(top: 16,left: 10,bottom: 3),
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                                hintText: 'Last Name',
                                hintStyle: TextStyle(
                                    color: Colors.white
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Expanded(
                    child: Container(
                      height: 50,
                      width: 194,
                      padding: const EdgeInsets.only(top: 16,left: 10,bottom: 3),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                                color: Colors.white
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            )
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child:  Container(
                          height: 50,
                          width: 194,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DropdownButton<String>(
                                value: _selectedCountry,
                                icon: SizedBox.shrink(),
                                iconSize: 0,
                                elevation: 16,
                                style: const TextStyle(color: Colors.white),
                                underline: Container(
                                  height: 2,
                                  color: Colors.transparent,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedCountry = newValue!;
                                  });
                                },
                                items: <String>['USA', 'AUS', 'UAE', 'CAN']
                                    .map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(value,style: TextStyle(color: Colors.black),),
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                              SvgPicture.asset(
                                'assets/icons/dropdown_icon.svg',
                                color: Colors.white,
                                width: 10,
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width:10),
                      Expanded(
                        child: Container(
                          height: 50,
                          width: 194,
                          padding: const EdgeInsets.only(top: 16,left: 10,bottom: 3),
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                                hintText: 'Phone',
                                hintStyle: TextStyle(
                                    color: Colors.white
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Expanded(
                    child: Container(
                      height: 50,
                      width: 194,
                      padding: const EdgeInsets.only(top: 16,left: 10,bottom: 3),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.white
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                //TODO: Form Field
              ],
            ),
          ),
        ],
      ),
    );
  }
}
