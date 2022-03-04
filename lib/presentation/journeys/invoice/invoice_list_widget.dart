import 'package:flutter/material.dart';
import 'package:restobuy_restaurant_flutter/data/models/invoice_api_res_model.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/no_data_found.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_with_width.dart';

class InvoiceListWidget extends StatelessWidget {
  final List<Response> response;
  final int index;
  final Function(int index) onTapOnList;
  final Function onRefreshed;

  const InvoiceListWidget({
    Key? key,
    required this.response,
    required this.index,
    required this.onTapOnList,
    required this.onRefreshed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Txt(
                  txt: 'Order Id - ${response[index].invoiceId}',
                  txtColor: Colors.amber,
                  txtSize: 14,
                  fontWeight: FontWeight.bold,
                  padding: 3,
                ),

                Txt(
                  txt: response[index].supplierName!,
                  txtColor: Colors.black,
                  txtSize: 16,
                  fontWeight: FontWeight.bold,
                  padding: 3,
                ),

                Txt(
                  txt: response[index].datetime!,
                  txtColor: Colors.black54,
                  txtSize: 14,
                  fontWeight: FontWeight.normal,
                  padding: 3,
                ),
              ],
            ),

            Column(
              children: [
                Txt(
                  txt: response[index].invoiceAmount!,
                  txtColor: Colors.black,
                  txtSize: 16,
                  fontWeight: FontWeight.bold,
                  padding: 5,
                ),
              ],
            ),
          ],
        ),
      ),

      onTap: (){
        onTapOnList(index);
      },
    );
  }
}
