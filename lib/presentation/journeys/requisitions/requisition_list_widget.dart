import 'package:flutter/material.dart';
import 'package:restobuy_restaurant_flutter/presentation/themes/theme_color.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/no_data_found.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt.dart';
import 'package:restobuy_restaurant_flutter/data/models/requisition_api_res_model.dart';

class RequisitionListWidget extends StatelessWidget {
  final List<Requisitions> response;
  final int index;
  final Function(int index) onTapOnList;
  final Function(int index) onView;
  final Function(int index) onSave;
  final Function(int index) onDelete;
  final Function(int index) onAddToCart;
  final Function onRefreshed;

  const RequisitionListWidget({
    Key? key,
    required this.response,
    required this.index,
    required this.onTapOnList,
    required this.onView,
    required this.onSave,
    required this.onDelete,
    required this.onAddToCart,
    required this.onRefreshed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('----isRequisitionTabSelected : $isRequisitionTabSelected');
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Txt(
                txt: 'Order id - ${response[index].requisitionid}',
                txtColor: AppColor.appTxtAmber,
                txtSize: 16,
                fontWeight: FontWeight.bold,
                padding: 5,
              ),

              /*
                                    const Txt(
                                      txt: 'Product Name',
                                      txtColor: Colors.black,
                                      txtSize: 14,
                                      fontWeight: FontWeight.bold,
                                      padding: 5,
                                    ),*/

              Txt(
                txt: 'Date & Time - ${response[index].datetime!}',
                txtColor: Colors.black54,
                txtSize: 14,
                fontWeight: FontWeight.normal,
                padding: 5,
              ),

              Txt(
                txt: '${response[index].totalItems!} Items',
                txtColor: Colors.black,
                txtSize: 14,
                fontWeight: FontWeight.normal,
                padding: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      child: Container(
                        height: 35,
                        margin: const EdgeInsets.only(top: 8, right: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        alignment: Alignment.center,
                        child: const Txt(
                          txt: 'View',
                          txtColor: Colors.black,
                          txtSize: 14,
                          fontWeight: FontWeight.normal,
                          padding: 3,
                        ),
                      ),
                      onTap: () {
                        onView(index);
                      },
                    ),
                  ),
                  Visibility(
                    visible: response[index].save! == 0,
                    child: Expanded(
                      flex: 1,
                      child: InkWell(
                        child: Container(
                          height: 35,
                          margin: const EdgeInsets.only(top: 8, left: 4, right: 4),
                          decoration: BoxDecoration(
                            color: Colors.lightGreenAccent.withOpacity(0.3),
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                          alignment: Alignment.center,
                          child: const Txt(
                            txt: 'Save',
                            txtColor: Colors.black,
                            txtSize: 14,
                            fontWeight: FontWeight.normal,
                            padding: 3,
                          ),
                        ),
                        onTap: () {
                          onSave(index);
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: response[index].delete! == 0,
                    child: Expanded(
                      flex: 1,
                      child: InkWell(
                        child: Container(
                          height: 35,
                          margin: const EdgeInsets.only(top: 8, left: 4,),
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent.withOpacity(0.1),
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                          alignment: Alignment.center,
                          child: const Txt(
                            txt: 'Delete',
                            txtColor: Colors.black,
                            txtSize: 14,
                            fontWeight: FontWeight.normal,
                            padding: 3,
                          ),
                        ),
                        onTap: () {
                          onDelete(index);
                        },
                      ),
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
          //print('---- : -----');
          onRefreshed();
        },
      );
    }
  }
}
