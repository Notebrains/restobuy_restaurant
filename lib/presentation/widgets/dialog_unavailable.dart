
import 'package:flutter/material.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/drop_down_input.dart';
import 'package:restobuy_restaurant_flutter/presentation/themes/theme_color.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_if_preview.dart';


Future showDropDownDialogForUnavailable(context, String category, String productName, String varient, String qty,  Function(String value) onClose) async {
  String userInput = 'Approve';
  return await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Txt(
                        txt: 'Available Product',
                        txtColor: AppColor.grey,
                        txtSize: 18,
                        fontWeight: FontWeight.bold,
                        padding: 16,
                      ),

                      TxtIfPreview(txt: 'Category', ifTxt: category, icon: null, onTap: (){}),

                      TxtIfPreview(txt: 'Product name', ifTxt: productName, icon: null, onTap: (){}),

                      TxtIfPreview(txt: 'Variant', ifTxt: varient, icon: null, onTap: (){}),

                      TxtIfPreview(txt: 'Quantity', ifTxt: qty, icon: null, onTap: (){}),

                      Padding(
                        padding: const EdgeInsets.only(top: 14, bottom: 12),
                        child: AppDropdownInput(
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
                      ),

                      InkWell(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 5, top: 12,),
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
                            padding: 5,
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
                          margin: const EdgeInsets.only(bottom: 5, top: 12,),
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
                            padding: 5,
                          ),
                        ),

                        onTap: (){
                          Navigator.of(context).pop();
                        },
                      ),
                    ]
                ),
              ),
            );
          },
        ),
      );
    },
  );
}