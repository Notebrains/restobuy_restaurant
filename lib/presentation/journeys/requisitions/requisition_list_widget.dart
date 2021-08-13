import 'package:flutter/material.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/no_data_found.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt_with_width.dart';

class RequisitionListWidget extends StatelessWidget {
  final int index;
  final bool isRequisitionTabSelected;
  final Function(int index) onTapOnList;
  final Function onRefreshed;

  RequisitionListWidget({
    Key? key,
    required this.index,
    required this.isRequisitionTabSelected,
    required this.onTapOnList,
    required this.onRefreshed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('----isRequisitionTabSelected : $isRequisitionTabSelected');
    if ('ssdsd'.isNotEmpty) {
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
                        txt: 'ORDER ID - ID23232323',
                        txtColor: Colors.amber,
                        txtSize: 14,
                        fontWeight: FontWeight.bold,
                        padding: 5,
                        onTap:  (){},
                      ),

                      Txt(
                        txt: 'Product Name',
                        txtColor: Colors.black,
                        txtSize: 16,
                        fontWeight: FontWeight.bold,
                        padding: 5,
                        onTap: () {
                        },
                      ),

                      Visibility(
                        visible: !isRequisitionTabSelected,
                        child: Txt(
                          txt: 'Posted                         Next Delivery',
                          txtColor: Colors.black87,
                          txtSize: 14,
                          fontWeight: FontWeight.normal,
                          padding: 5,
                          onTap: () {
                          },
                        ),
                      ),

                      Txt(
                        txt: isRequisitionTabSelected? '29-07-21  13.40':
                        '29-07-21  13.40         29-07-21  13.40',
                        txtColor: Colors.black54,
                        txtSize: 14,
                        fontWeight: FontWeight.normal,
                        padding: 5,
                        onTap: () {
                        },
                      ),

                      Visibility(
                        visible: !isRequisitionTabSelected,
                        child: Txt(
                          txt: 'Duration 1 day',
                          txtColor: Colors.black54,
                          txtSize: 14,
                          fontWeight: FontWeight.normal,
                          padding: 5,
                          onTap: () {
                          },
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Txt(
                        txt: '5 Items',
                        txtColor: Colors.black,
                        txtSize: 14,
                        fontWeight: FontWeight.normal,
                        padding: 5,
                        onTap: () {
                        },
                      ),

                      Txt(
                        txt: 'Available',
                        txtColor: Colors.green,
                        txtSize: 14,
                        fontWeight: FontWeight.normal,
                        padding: 5,
                        onTap: () {},
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
                          color: Colors.grey.withOpacity(0.1),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        alignment: Alignment.center,
                        child: Txt(
                          txt: 'Edit',
                          txtColor: Colors.black,
                          txtSize: 14,
                          fontWeight: FontWeight.normal,
                          padding: 3,
                          onTap:  (){},
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
                          color: Colors.pinkAccent.withOpacity(0.1),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        alignment: Alignment.center,
                        child: Txt(
                          txt: 'Delete',
                          txtColor: Colors.black,
                          txtSize: 14,
                          fontWeight: FontWeight.normal,
                          padding: 3,
                          onTap:  (){},
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
          print('---- : -----');
          onRefreshed();
        },
      );
    }
  }
}
