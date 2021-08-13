import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:restobuy_restaurant_flutter/common/constants/route_constants.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/requisitions/create_requisition.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/appbar_ic_back.dart';
import 'package:restobuy_restaurant_flutter/presentation/widgets/txt.dart';

import 'requisition_list_widget.dart';


class Requisition extends StatefulWidget {

  @override
  _RequisitionsState createState() => _RequisitionsState();
}

class _RequisitionsState extends State<Requisition> {
  TextEditingController controller = TextEditingController();
  String fromDateStr = '', toDateStr = '';
  bool isRequisitionTabSelected = true;
  late DateTime fromDate;
  late DateTime toDate;
  late List<String> _searchResult = [];
  late List<String> listData = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarIcBack(context, 'Requisition'),
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SlideInLeft(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 45,
                  margin: const EdgeInsets.only(bottom: 5, top: 12, left: 16, right: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: isRequisitionTabSelected? Colors.amber : Colors.grey.shade50),
                  ),
                  alignment: Alignment.center,
                  child:
                  Txt(
                    txt: '  Requisition  ',
                    txtColor: isRequisitionTabSelected? Colors.amber : Colors.black,
                    txtSize: 16,
                    fontWeight: FontWeight.bold,
                    padding: 6,
                    onTap: (){
                      print('---- 1:');
                      setState(() {
                        isRequisitionTabSelected = true;
                      });
                    },
                  ),
                ),

                Container(
                  height: 45,
                  margin: const EdgeInsets.only(bottom: 5, top: 12, left: 4, right: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: isRequisitionTabSelected? Colors.grey.shade50: Colors.amber),
                  ),
                  alignment: Alignment.center,
                  child:
                  Txt(
                    txt: '  Recurring Requisition  ',
                    txtColor: isRequisitionTabSelected? Colors.black : Colors.amber,
                    txtSize: 16,
                    fontWeight: FontWeight.normal,
                    padding: 6,
                    onTap: (){
                      print('---- 2:');
                      setState(() {
                        isRequisitionTabSelected = false;
                      });
                    },
                  ),
                ),

              ],
            ),
          ),

          Expanded(
            child: buildUi(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.of(context).pushNamed(RouteList.create_requisitions);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateRequisition(isScreenRequisition: isRequisitionTabSelected,),
              ));
        },
        child: Icon(Icons.add, color: Colors.white, size: 30,),
        backgroundColor: Colors.amber.shade600,
        tooltip: 'Pressed',
        elevation: 5,
        splashColor: Colors.grey,
      ),
    );
  }

  Widget buildUi() {
    return SlideInUp(
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        child: ListView.builder(
            itemCount: 12,
            itemBuilder: (BuildContext context, int index) {
              return RequisitionListWidget(
                //response: _searchResult,
                index: index,
                isRequisitionTabSelected: isRequisitionTabSelected,
                onTapOnList: (intValue){
                  Navigator.of(context).pushNamed(RouteList.requisitions_details);
                },
                onRefreshed: () {
                },
              );
            }),
      ),
    );
  }
}
