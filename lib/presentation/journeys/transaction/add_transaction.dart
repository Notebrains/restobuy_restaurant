import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:restobuy_restaurant_flutter/common/extensions/common_fun.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/my_requisition/custom_app_bar.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/appbar_back_cart.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/button.dart';
import 'package:restobuy_restaurant_flutter/presentation/libraries/drop_down_input.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_ic_row.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_input_field.dart';

class AddTransaction extends StatefulWidget {
  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  String fromDateStr = '';
  late DateTime fromDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context, title: 'Add Transaction'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 24),
              child: AppDropdownInput(
                hintText: "Select Supplier",
                options: ["Choose Option", "Supplier One", "Supplier Two"],
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
              margin: EdgeInsets.only(left: 20, right: 20, top: 24),
              child: AppDropdownInput(
                hintText: "Select Invoice",
                options: ["Choose Option", "Invoice One", "Invoice Two"],
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
              txt: 'Transaction Id',
              initialTxtValue: '',
              hint: 'Enter here',
              isReadOnly: false,
              textInputType: TextInputType.text,
              onSaved: (value){},
            ),

            InkWell(
              child: Container(
                height: 45,
                margin: const EdgeInsets.only(bottom: 5, top: 20, left: 20, right: 20),
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                alignment: Alignment.centerLeft,
                child: TxtIcRow(
                  txt: fromDateStr.isEmpty ? '  Date & Time' : fromDateStr,
                  txtColor: Colors.black,
                  txtSize: 14,
                  fontWeight: FontWeight.normal,
                  icon: Icons.date_range_outlined,
                  icColor: Colors.black,
                  isCenter: false,),
              ),
              onTap: () {
                pickDateFromDatePicker();
              },
            ),

            TxtIf(
              txt: 'Amount in (\$)',
              initialTxtValue: '',
              hint: 'Enter here',
              isReadOnly: false,
              textInputType: TextInputType.number,
              onSaved: (value){},
            ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 24),
              child: AppDropdownInput(
                hintText: "Payment Mode",
                options: ["Choose Option", "Payment Mode One", "Payment Mode Two"],
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
              margin: EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 24),
              child: AppDropdownInput(
                hintText: "Payment Status",
                options: ["Choose Option", "Payment Status One", "Payment Status Two"],
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
              padding: const EdgeInsets.all(18.0),
              child: Button(text: 'ADD', onPressed: (){

              }),
            ),
          ],
        ),
      ),
    );
  }

  void pickDateFromDatePicker() {
    SchedulerBinding.instance!.addPostFrameCallback((_) async {
      fromDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 0);
      DateTime? picked = await showDatePicker(
          context: context,
          initialEntryMode: DatePickerEntryMode.calendar,
          firstDate: DateTime.now().subtract(Duration(days: 15000)),
          lastDate: DateTime(DateTime.now().year + 1),
          initialDate: fromDate,
          currentDate: fromDate,
          helpText: 'SELECT DATE',
          // Can be used as title
          cancelText: 'NOT NOW',
          confirmText: 'CONFIRM',
          builder: (context, child) {
            return Theme(
              data: ThemeData(
                textTheme: TextTheme(bodyText2: TextStyle(color: Colors.green)),
              ),
              child: child!,
            );
          });

      if (picked != null && picked != fromDate)
        setState(() {
          fromDate = picked;
          fromDateStr = formatDateForUs(fromDate);
        });
    });
  }
}