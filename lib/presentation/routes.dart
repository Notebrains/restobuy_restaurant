import 'package:flutter/material.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/dispute/dispute.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/login/forgot_password.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/my_requisition/my_requisition.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/dispute/raise_dispute.dart';
import 'package:restobuy_restaurant_flutter/presentation/journeys/review/add_review.dart';
import 'journeys/product_details/product_details.dart';
import 'journeys/profile/profile.dart';
import 'journeys/purchase_order/purchase_order.dart';
import 'journeys/purchase_order_details/purchase_order_details.dart';
import 'journeys/raise_invoice/raise_invoice.dart';
import 'journeys/requisitions/requisition.dart';
import 'journeys/requisitions_details/save_requisation_details.dart';
import 'journeys/review/review.dart';
import 'journeys/setting/setting.dart';
import 'journeys/transaction/add_transaction.dart';
import 'journeys/transaction/transaction.dart';
import 'journeys/home_screen/home_screen.dart';
import 'journeys/invoice_details/invoice_details.dart';
import 'journeys/invoice/invoice.dart';

import '../common/constants/route_constants.dart';
import 'journeys/login/login_screen.dart';
import 'journeys/product/product.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.initial: (context) => const LoginScreen(),
        RouteList.login: (context) => const LoginScreen(),

        RouteList.forgot_password: (context) =>  const ForgotPassword(),
        RouteList.home_screen: (context) => const HomeScreen(),
        RouteList.product: (context) => const Product(),
        RouteList.product_details: (context) =>  const ProductDetails(productId: '',),
        RouteList.invoice: (context) => const Invoice(),
        //RouteList.invoice_details: (context) => InvoiceDetails(),
        RouteList.invoice_raise: (context) => RaiseInvoice(),
        //RouteList.add_review: (context) => AddReview(),
        RouteList.raise_dispute: (context) => const RaiseDispute(),
        RouteList.purchase_order: (context) => const PurchaseOrder(),
        //RouteList.purchase_order_details: (context) => const PurchaseOrderDetails(),
        RouteList.transaction: (context) => const Transaction(),
        RouteList.add_transaction: (context) => AddTransaction(),
        RouteList.review: (context) => const Review(),
        RouteList.requisitions: (context) => const Requisition(),
        //RouteList.create_requisitions: (context) => CreateRequisition(isScreenRequisition: true,),
        //RouteList.requisitions_details: (context) => const RequisitionDetails(),
        RouteList.profile: (context) => const Profile(),
        RouteList.setting: (context) => Setting(),
        RouteList.my_requisition: (context) => const MyRequisition(),
        RouteList.dispute: (context) => const Dispute(),
      };
}
