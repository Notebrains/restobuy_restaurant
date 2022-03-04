import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:restobuy_restaurant_flutter/data/models/transaction_api_res_model.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/no_data_found.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_with_width.dart';

class TransactionListWidget extends StatelessWidget {
  final List<Response> response;
  final int index;
  final Function(int index) onTapOnList;
  final Function onRefreshed;

  const TransactionListWidget({
    Key? key,
    required this.response,
    required this.index,
    required this.onTapOnList,
    required this.onRefreshed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (response.isNotEmpty) {
      return InkWell(
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Txt(
                        txt: 'Id - ${response[index].transactionId}',
                        txtColor: Colors.amber.shade600,
                        txtSize: 14,
                        fontWeight: FontWeight.bold,
                        padding: 3,
                      ),

                      Txt(
                        txt: response[index].restaurantName!,
                        txtColor: Colors.black,
                        txtSize: 16,
                        fontWeight: FontWeight.bold,
                        padding: 3,
                      ),

                      Txt(
                        txt: 'Invoice Id - \n${response[index].invoiceId}',
                        txtColor: Colors.black54,
                        txtSize: 14,
                        fontWeight: FontWeight.normal,
                        padding: 3,
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Txt(
                        txt: 'Date & Time -\n${response[index].datetime!}' ,
                        txtColor: Colors.black,
                        txtSize: 14,
                        fontWeight: FontWeight.normal,
                        padding: 5,
                      ),
                      Txt(
                        txt: 'Amount - ${response[index].transactionAmount!}',
                        txtColor: Colors.black,
                        txtSize: 16,
                        fontWeight: FontWeight.bold,
                        padding: 5,
                      ),
                    ],
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.only(top: 8, right: 4),
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent.shade100,
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        alignment: Alignment.center,
                        child: Txt(
                          txt: response[index].transactionStatus!,
                          txtColor: Colors.black,
                          txtSize: 14,
                          fontWeight: FontWeight.normal,
                          padding: 3,
                        ),
                      ),
                      onTap: () {

                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.only(top: 8, left: 4,),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        alignment: Alignment.center,
                        child: Txt(
                          txt: response[index].paymentMode!,
                          txtColor: Colors.black,
                          txtSize: 14,
                          fontWeight: FontWeight.normal,
                          padding: 3,
                        ),
                      ),
                      onTap: () {

                      },
                    ),
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
    } else {
      return NoDataFound(txt: 'No data found',
        onRefresh: (){
          onRefreshed();
        },
      );
    }
  }
}
