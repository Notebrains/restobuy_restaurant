import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:restobuy_restaurant_flutter/common/extensions/common_fun.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/appbar_back_cart.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/button.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/drop_down_input.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_ic_row.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_input_field.dart';

class CreateRequisition extends StatefulWidget {
  final bool isScreenRequisition;

  const CreateRequisition({Key? key, required this.isScreenRequisition}) : super(key: key);

  @override
  _CreateRequisitionState createState() => _CreateRequisitionState();
}

class _CreateRequisitionState extends State<CreateRequisition> {
  String fromDateStr = '';
  late DateTime fromDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarIcBackCart(context, 'Create Requisition'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 8),
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

            Visibility(
              visible: !widget.isScreenRequisition,
              child: InkWell(
                child: Container(
                  height: 45,
                  margin: const EdgeInsets.only(bottom: 5, top: 16, left: 20, right: 20),
                  padding: const EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  alignment: Alignment.centerLeft,
                  child: TxtIcRow(
                    txt: fromDateStr.isEmpty ? '  Date' : fromDateStr,
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
            ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 8),
              child: AppDropdownInput(
                hintText: "Select Category",
                options: ["Choose Option", "Category One", "Category Two"],
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
              margin: EdgeInsets.only(left: 20, right: 20, top: 8),
              child: AppDropdownInput(
                hintText: "Select Sub Category",
                options: ["Choose Option", "Sub Category One", "Sub Category Two"],
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
              margin: EdgeInsets.only(left: 20, right: 20, top: 8),
              child: AppDropdownInput(
                hintText: "Select Product",
                options: ["Choose Option", "Product One", "Product Two"],
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
              margin: EdgeInsets.only(left: 20, right: 20, top: 8),
              child: AppDropdownInput(
                hintText: "Select Variant",
                options: ["Choose Option", "Variant One", "Variant Two"],
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
                txt: 'Quantity',
                initialTxtValue: '',
                hint: 'Enter here',
                isReadOnly: false,
                textInputType: TextInputType.number,
            ),

            Container(
              padding: const EdgeInsets.all(18.0),
              child: Button(text: 'Add More', onPressed: (){

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