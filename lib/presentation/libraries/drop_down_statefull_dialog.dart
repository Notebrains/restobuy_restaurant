
import 'package:flutter/material.dart';
import 'package:restobuy_restaurant_flutter/presentation/themes/theme_color.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_if_preview.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_input_field.dart';

import 'drop_down_input.dart';

Future showDropDownDialog(context, String qty, Function(String value) onClose) async {
  String userInput = 'Approve';
  return await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Txt(
                    txt: 'Partially Available',
                    txtColor: AppColor.grey,
                    txtSize: 16,
                    fontWeight: FontWeight.normal,
                    padding: 3,
                  ),

                  TxtIfPreview(txt: 'Qty', ifTxt: qty, icon: null, onTap: (){}),

                  AppDropdownInput(
                    hintText: "Choose",
                    options: const ['Approve', "Cancel"],
                    value: userInput,
                    onChanged: (String? value) {
                      setState(() {
                        userInput = value!;
                      });
                    },
                    getLabel: (String value) => value,
                  ),

                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 5, top: 24,),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(color: Colors.grey, width: 0.5),
                          boxShadow: [
                            BoxShadow(color: Colors.grey.shade300,
                              blurRadius: 6,
                            )
                          ]
                      ),

                      alignment: Alignment.center,
                      child: const Txt(
                        txt: 'Submit',
                        txtColor: AppColor.grey,
                        txtSize: 14,
                        fontWeight: FontWeight.normal,
                        padding: 3,
                      ),
                    ),

                    onTap: (){
                      Navigator.pop(context);
                      if (userInput == 'Approve') {
                        onClose('Available');
                      } else if (userInput == 'Cancel'){
                        onClose('Cancelled');
                      }
                    },
                  ),

                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 5, top: 24,),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(color: Colors.grey, width: 0.5),
                          boxShadow: [
                            BoxShadow(color: Colors.grey.shade100,
                              blurRadius: 6,
                            )
                          ]
                      ),

                      alignment: Alignment.center,
                      child: const Txt(
                        txt: 'Cancel',
                        txtColor: AppColor.grey,
                        txtSize: 14,
                        fontWeight: FontWeight.normal,
                        padding: 3,
                      ),
                    ),

                    onTap: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ]
            );
          },
        ),
      );
    },
  );
}