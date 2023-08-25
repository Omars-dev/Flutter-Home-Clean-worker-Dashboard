import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_clean_worker_dashboard/utils/constrants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
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

  String _selectedCountry = 'USA';

  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  bool _saveLoginInfo = false;

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
                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
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
                // TODO: User Section
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
                          // TODO: File Upload Profile Shape
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

                              // TODO: Image Upload Camera Button
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
                const SizedBox(height: 25),

                // TODO: Form Field
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('First Name', style: inputLabelTextStyle),
                            const SizedBox(height: 13),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.only(top: 16, left: 10, bottom: 5),
                              decoration: BoxDecoration(
                                  color: inputFieldBox,
                                  borderRadius: BorderRadius.circular(12)),
                              child: const TextField(
                                decoration: InputDecoration(
                                    hintText: 'Akkas',
                                    hintStyle: hintActiveTextStyle,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Last Name', style: inputLabelTextStyle),
                            const SizedBox(height: 13),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.only(top: 16, left: 10, bottom: 5),
                              decoration: BoxDecoration(
                                  color: inputFieldBox,
                                  borderRadius: BorderRadius.circular(12)),
                              child: const TextField(
                                decoration: InputDecoration(
                                    hintText: 'Mia',
                                    hintStyle: hintActiveTextStyle,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Email Address', style: disabledTextStyle),
                      const SizedBox(height: 13),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.only(top: 16, left: 10, bottom: 5),
                        decoration: BoxDecoration(
                            color: inputFieldBox,
                            borderRadius: BorderRadius.circular(12)),
                        child: const TextField(
                          enabled: false,
                          decoration: InputDecoration(
                              hintText: 'akkas.cse@gmail.com',
                              hintStyle: disabledTextStyle,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            showCountryPicker();
                            print(_selectedCountry);
                          },
                          child: DropdownButtonHideUnderline(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Country', style: inputLabelTextStyle),
                                const SizedBox(height: 13),
                                Container(
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: inputFieldBox,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12),
                                        child: Text(_selectedCountry,
                                            style: hintActiveTextStyle),
                                      ),
                                      SvgPicture.asset(
                                        'assets/icons/dropdown_icon.svg',
                                        color: blackColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Phone', style: inputLabelTextStyle),
                            const SizedBox(height: 13),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.only(top: 16, left: 10, bottom: 5),
                              decoration: BoxDecoration(
                                  color: inputFieldBox,
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                controller: _phoneNumberController,
                                inputFormatters: [LengthLimitingTextInputFormatter(12)],
                                decoration: InputDecoration(
                                  hintText: '765968009',
                                  hintStyle: hintActiveTextStyle,
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  suffixIcon: IconButton(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    color: blackColor,
                                    onPressed: () {
                                      setState(() {
                                        _phoneNumberController.clear();
                                      });
                                    },
                                    icon: const Icon(Icons.cancel,size: 20,),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 45,
                        width: 250,
                        padding: const EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: secondaryBtnColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/lock.svg'),
                            const SizedBox(width: 10),
                            const Text('Change Password', style: secondaryButtonTextStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // TODO: Form Submit Button
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Save Login Info', style: TextStyle(color: blackColor,fontWeight: FontWeight.w600,fontSize: 18),textAlign: TextAlign.left,),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          //TODO: Switch Button width 30
                          Switch(
                            activeTrackColor: primaryColor,
                            activeColor: secondaryColor,
                            value: _saveLoginInfo,
                            onChanged: (newValue) {
                              setState(() {
                                _saveLoginInfo = newValue;
                              });
                            },
                          ),

                          //Text
                          const Flexible(
                            child: Text(
                              'We save the login info, so you won’t need to enter it on Android devices',
                              style: hintTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: const Text('SIGN IN', style: mainButtonTextStyle),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showCountryPicker() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Country'),
          content: DropdownButton<String>(
            value: _selectedCountry,
            onChanged: (String? newValue) {
              setState(() {
                _selectedCountry = newValue!;
              });
              Navigator.pop(context);
            },
            items: <String>['USA', 'AUS', 'UAE', 'CAN']
                .map<DropdownMenuItem<String>>(
                  (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
