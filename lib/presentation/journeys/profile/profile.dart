import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restobuy_restaurant_flutter/common/constants/route_constants.dart';
import 'package:restobuy_restaurant_flutter/common/constants/size_constants.dart';
import 'package:restobuy_restaurant_flutter/common/constants/strings.dart';
import 'package:restobuy_restaurant_flutter/common/extensions/common_fun.dart';
import 'package:restobuy_restaurant_flutter/common/extensions/size_extensions.dart';
import 'package:restobuy_restaurant_flutter/data/core/api_constants.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/api_functions.dart';
import 'package:restobuy_restaurant_flutter/data/data_sources/local_data_source_shared_preferences.dart';
import 'package:restobuy_restaurant_flutter/data/models/status_message_api_res_model.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/login/label_field_widget.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/drop_down_input.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/edge_alerts/edge_alerts.dart';
import 'package:restobuy_restaurant_flutter/presentation/themes/theme_color.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/button.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/cached_net_img_radius.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/logo.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_if_preview.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_input_field.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String dob = '';
  String userId = '';
  String gender = 'Male';
  bool isChangePassword = false;

  late File? xFile = File('');
  String base64Image = '';

  @override
  void initState() {
    super.initState();

    getLocalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            InkWell(
              onTap: (){
                getImage();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 24),
                      child: setImage(xFile!.path),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /*Padding(
              padding: EdgeInsets.only(top: Sizes.dimen_14.h, bottom: 12),
              child: const Logo(height: 150,),
            ),*/

            TxtIf(
              txt: 'Name',
              initialTxtValue: nameController.text,
              hint: nameController.text.isEmpty? 'Enter full name here': nameController.text,
              icon: Icons.person,
              isReadOnly: false,
              textInputType: TextInputType.text,
              onSaved: (String value) {
                nameController.text = value;
              },
            ),
            TxtIf(
              txt: 'Email',
              initialTxtValue: emailController.text,
              hint: emailController.text.isEmpty? 'Enter email id here': emailController.text,
              icon: Icons.email,
              isReadOnly: true,
              textInputType: TextInputType.emailAddress,
              
              onSaved: (String value) {
                emailController.text = value;
                },
            ),

            TxtIf(
              txt: 'Phone',
              initialTxtValue: phoneController.text,
              hint: phoneController.text.isEmpty ? 'Enter phone number here' : phoneController.text,
              icon: Icons.call,
              isReadOnly: false,
              textInputType: TextInputType.phone,
              onSaved: (String value) {
                phoneController.text = value;
              },
              
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(20.0, 24, 20.0,0),
              child: AppDropdownInput(
                hintText: "Select Gender",
                options: const ['Male', "Female"],
                value: gender,
                onChanged: (String? value) {
                  setState(() {
                    gender = value!;
                      // state.didChange(newValue);
                  });
                },
                getLabel: (String value) => value,
              ),
            ),

            TxtIf(
              txt: 'City',
              initialTxtValue: cityController.text,
              hint: cityController.text.isEmpty ? 'Enter city here' : cityController.text,
              icon: Icons.location_city_rounded,
              isReadOnly: false,
              textInputType: TextInputType.text,
              onSaved: (String value) {
                cityController.text = value;
              },
              
            ),


            /*TxtIf(
              txt: 'State',
              initialTxtValue: stateController.text,
              hint: stateController.text.isEmpty ? 'Enter state here' : stateController.text,
              icon: Icons.my_location_rounded,
              isReadOnly: false,
              textInputType: TextInputType.text,
              
            ),*/

            TxtIf(
              txt: 'Country',
              initialTxtValue: countryController.text,
              hint: countryController.text.isEmpty ? 'Enter country here' : countryController.text,
              icon: Icons.my_location_rounded,
              isReadOnly: false,
              textInputType: TextInputType.text,
              onSaved: (String value) {
                countryController.text = value;
              },
              
            ),

            Padding(
              padding: const EdgeInsets.only(left: 13, right: 10),
              child: TxtIfPreview(txt: 'DOB', ifTxt: dob.isEmpty?'Enter date of birth here': dob, icon: Icons.date_range_rounded, onTap: (){
                pickDate(context).then((pickedDate) => {
                  setState(() {
                    dob = pickedDate;
                  }),
                });
              }),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: CheckboxListTile(
                activeColor: AppColor.appTxtAmber,
                title: const Text("Change password", style: TextStyle(color: AppColor.appTxtAmber),),
                value: isChangePassword,
                onChanged: (newValue) {
                  setState(() {
                    isChangePassword = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),

            Visibility(
              visible: isChangePassword,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0,0),
                child: LabelFieldWidget(
                  label: 'Old password',
                  hintText:  'Enter old password here',
                  controller: oldPasswordController,
                  isPasswordField: true,
                  ic: Icons.password_rounded,
                ),
              ),
            ),

            Visibility(
              visible: isChangePassword,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0,0),
                child: LabelFieldWidget(
                  label: 'New password',
                  hintText:  'Enter new password here',
                  controller: newPasswordController,
                  isPasswordField: true,
                  ic: Icons.password_rounded,
                ),
              ),
            ),

            Visibility(
              visible: isChangePassword,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0,0),
                child: LabelFieldWidget(
                  label: 'Confirm password',
                  hintText:  'Enter confirm password here',
                  controller: confirmPasswordController,
                  isPasswordField: true,
                  ic: Icons.password_rounded,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 24, 20.0, 0),
              child: Button(
                text: 'UPDATE',
                onPressed: () {
                  /*if (nameController.text.isEmpty) {
                    edgeAlert(context, title: 'Warning', description: AppStrings.inputFieldRequired);
                  } else if (emailController.text.isEmpty) {
                    edgeAlert(context, title: 'Warning', description: AppStrings.inputFieldRequired);
                  } else if (phoneController.text.isEmpty) {
                    edgeAlert(context, title: 'Warning', description: AppStrings.inputFieldRequired);
                  } else if (genderController.text.isEmpty) {
                    edgeAlert(context, title: 'Warning', description: AppStrings.inputFieldRequired);
                  } else if (dob.isEmpty) {
                    edgeAlert(context, title: 'Warning', description: AppStrings.inputFieldRequired);
                  } else */

                  if (isChangePassword && oldPasswordController.text.isEmpty) {
                    edgeAlert(context, title: 'Warning', description: 'Enter old password');
                  } else if (isChangePassword && newPasswordController.text.isEmpty) {
                    edgeAlert(context, title: 'Warning', description: 'Enter new password');
                  } else if (isChangePassword && newPasswordController.text != confirmPasswordController.text) {
                    edgeAlert(context, title: 'Warning', description: 'Password did not matched');
                  } else {
                    doUpdate();
                  }
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Button(
                text: 'LOGOUT',
                onPressed: () {
                  showIosDialog(
                      context,
                      'LOGOUT ?', "Are you sure you want to logout?",
                      'Cancel',
                      'Logout',
                      (){
                        Navigator.of(context).pushReplacementNamed(RouteList.login);
                        MySharedPreferences().clearPreferenceData();
                      }
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getImage() async {
    try {
      final imageFile = await ImagePicker().getImage(source: ImageSource.gallery);

      setState(() {
        xFile = File(imageFile!.path);
        //print('Image Path $xFile');
      });
    } catch (e) {
      //print(e);
    }
  }

  setImage(String path) {
    try {
      print('----path: $path , $base64Image');
      if (path.isEmpty) {
        return cachedNetImgWithRadius(
            base64Image.isNotEmpty? base64Image : Strings.imgUrlNotFoundYellowAvatar,
          150,
          150,
          30, BoxFit.contain
        );
      } else {
        final bytes = File(path).readAsBytesSync();
        base64Image = base64Encode(bytes);
        //print('-----base64Image:  $base64Image');

        return CircleAvatar(
          radius: 57,
          backgroundColor : Colors.amber,
          child: ClipOval(
            child: SizedBox(
              width: 100.0,
              height: 100.0,
              child: Image.file(
                File(xFile!.path),
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void getLocalData() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      MySharedPreferences().getUserDetails().then((userModel) {
        userId = userModel.response!.userId.toString();
        nameController.text = userModel.response!.name ?? '';
        emailController.text = userModel.response!.email ?? '';
        phoneController.text = userModel.response!.mobile ?? '';
        base64Image = userModel.response!.image ?? Strings.imgUrlNotFoundYellowAvatar;
        //gender = userModel.response!.gender ?? '';
        cityController.text = userModel.response!.city ?? '';
        countryController.text = userModel.response!.country ?? '';

        if (kDebugMode) {
          print('----name : ${userModel.response!.name}');
        }
      });
      setState(() {});
    });
  }

  void doUpdate() async {
    if (kDebugMode) {
      print('---- Name, Image, DOB, gender: ${nameController.text}, $gender, $dob, $base64Image');
    }
    showLoadingDialog(context);

    Map<String, dynamic> data = {};
    data["user_id"] = userId;
    data["name"] = nameController.text;
    data["mobile"] = emailController.text;
    data["dob"] = phoneController.text;
    data["image"] = base64Image;
    data["gender"] = gender;
    data["city"] = cityController.text;
    data["country"] = countryController.text;
    data["status"] = '';
    data["password"] = newPasswordController.text;

    await ApiFun.apiPostWithBody(ApiConstants.updateProfile, data).then((jsonDecodeData){
      StatusMessageApiResModel model = StatusMessageApiResModel.fromJson(jsonDecodeData);
      edgeAlert(context, title: 'Message', description: model.message!);
      //MySharedPreferences().saveUserDetails(model);

      if (kDebugMode) {
        print('----Login Res : ${model.message}');
      }

      //MySharedPreferences().saveUserId(model.userId.toString());
      //MySharedPreferences().saveUserDetails(model);

    });
  }
}
