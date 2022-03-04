import 'package:flutter/material.dart';
import 'package:restobuy_restaurant_flutter/common/constants/strings.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/my_requisition/custom_app_bar.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/appbar_back_cart.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/button.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/drop_down_input.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_input_field.dart';

class RaiseInvoice extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context, title: 'Raise Invoice'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 18),
              child: AppDropdownInput(
                hintText: "Select Restaurant",
                options: const ["Choose Option", "Restaurant One", "Restaurant Two"],
                value: 'Choose Option',
                onChanged: (String? value) {
                  /*setState(() {
                    gender = value;
                    // state.didChange(newValue);
                  });*/
                },
                getLabel: (String value) => value,
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 18),
              child: AppDropdownInput(
                hintText: "Select PO",
                options: const ["Choose Option", "PO One", "PO Two"],
                value: 'Choose Option',
                onChanged: (String? value) {
                  /*setState(() {
                    gender = value;
                    // state.didChange(newValue);
                  });*/
                },
                getLabel: (String value) => value,
              ),
            ),


            TxtIf(
              txt: 'Invoice ID',
              initialTxtValue: '',
              hint: '',
              icon: null,
              isReadOnly: false,
              textInputType: TextInputType.text,
              onSaved: (String value) {  },
              //validator: validator,
              //onSaved: onSaved,
            ),

            TxtIf(
              txt: 'Date and Time',
              initialTxtValue: '',
              hint: '',
              icon: null,
              isReadOnly: false,
              textInputType: TextInputType.text,
              onSaved: (String value) {  },
              //validator: validator,
              //onSaved: onSaved,
            ),

            TxtIf(
              txt: 'Amount',
              initialTxtValue: '',
              hint: '',
              icon: null,
              isReadOnly: false,
              textInputType: TextInputType.text,
              onSaved: (String value) {  },
              //validator: validator,
              //onSaved: onSaved,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 24, 20.0, 8),
              child: Button(text: 'Generate Invoice', onPressed: () {  },),
            ),
          ],
        ),
      ),
    );
  }
}